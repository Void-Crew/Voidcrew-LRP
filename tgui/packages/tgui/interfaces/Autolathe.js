import { Fragment } from 'inferno';
import { createSearch } from 'common/string';
import { flow } from 'common/fp';
import { filter, sortBy } from 'common/collections';
import { classes } from 'common/react';
import { useBackend, useLocalState } from '../backend';
import { Box, Button, Flex, Input, Grid, NumberInput, NoticeBox, Section, Table } from '../components';
import { Window } from '../layouts';
import { useDebug } from '../debug';

export const searchDesigns = (designs, searchText = '') => {
  const testSearch = createSearch(searchText, design => design.name);
  return flow([
    // Optional search term
    searchText && filter(testSearch),
    // Slightly expensive, but way better than sorting in BYOND
    sortBy(design => design.name),
  ])(designs);
};

const MaxMultiplier = (materials, design) => {
  let maxmulti = [];
  let currentmult = 1;
  let disabled = false;
  let tooltip = "";
  for (let i = 0; i < 4; i++) {
    tooltip = "";
    for (const [key, value] of Object.entries(design["materials"])) {
      if (tooltip !== "") tooltip = tooltip + "   ";
      tooltip = tooltip + (value*currentmult) + " " + key + " cm³";
    }

    for (const [key, value] of Object.entries(materials)) {
      if (value < design["materials"][key]*currentmult) {
        disabled = true;
      }
    }
    maxmulti.push({ "count": currentmult, "disabled": disabled, "tooltip": tooltip });
    if (currentmult === 1) { currentmult = 5; }
    else currentmult += 10;
  }
  return maxmulti;
};

const ColorCodeCategory = category => {
  let color = "#ffffff";

  if (category.includes("hacked")) {
    color = "#c9b971";
  }

  if (category.includes("emagged")) {
    color = "#963a46";
  }

  return color;
};

export const Autolathe = (props, context) => {
  const [
    sheetnumberglass,
    setGlassSheetCount,
  ] = useLocalState(context, 'sheetnumberglass', 0);
  const [
    sheetnumbermetal,
    setMetalSheetCount,
  ] = useLocalState(context, 'sheetnumbermetal', 0);
  const [
    setcategory,
    setCategory,
  ] = useLocalState(context, 'setcategory', 'Tools');

  const { act, data } = useBackend(context);
  const [
    searchText,
    setSearchText,
  ] = useLocalState(context, 'searchText', '');
  const searchdesign = searchDesigns(data.designs, searchText);

  const GetMapArr = (searchlen, designs) => {
    if (searchlen > 1) {
      return searchdesign;
    }
    return designs.filter(design => {
      return (design.category.includes(setcategory));
    });
  };

  return (
    <Window width={1116} height={703} resizable>
      <Window.Content scrollable>
        <Section
          title={("Autolathe")}
          buttons={(
            <Box inline ml={80}>
              Search:
              <Input
                value={searchText}
                width="250px"
                onInput={(e, value) => setSearchText(value)}
                ml={2}
                mr={5} />
              <Button
                icon="eject"
                content="Eject Materials"
                onClick={() => act('eject_mats')} />
            </Box>
          )}>
          <Grid>
            <Grid.Column size={3.0}>
              <div>
                <font color={(data.total_amount > 0 ? '#c9b971' : 'red')}>
                  <Box inline mr={1} mb={1} ml={1} mt={1}>
                    <b>Total amount: </b>
                  </Box>
                  {data.total_amount} / {data.max_amount} cm³
                </font>
                <br />
                <font color={(data.stored_materials.iron > 0 ? '#c9b971' : 'red')}>
                  <Box inline mr={1} mb={1} ml={1}>
                    <b>Metal amount: </b>
                  </Box>
                  {data.stored_materials.iron} cm³
                </font>
                <br />
                <font color={(data.stored_materials.glass > 0 ? '#c9b971' : 'red')}>
                  <Box inline mr={1} ml={1}>
                    <b>Glass amount:</b>
                  </Box>
                  {data.stored_materials.glass} cm³
                </font>
              </div>
            </Grid.Column>
            <Grid.Column size={1.7}>
              <div align="right">
                Print Location:
                <Button
                  mr={10}
                  ml={2}
                  mb={1}
                  disabled={data.abovewall}
                  color={data.printdir === 1 ? ("green"):("yellow")}
                  icon={"chevron-up"}
                  onClick={() => act('printdir', { direction: '1' })}
                />
                <br /><Button
                  ml={1}
                  disabled={data.leftwall}
                  color={data.printdir === 8 ? ("green"):("yellow")}
                  icon={"chevron-left"}
                  onClick={() => act('printdir', { direction: '8' })}
                />
                <Button
                  ml={1}
                  icon="print"
                  color={data.printdir === 0 ? ("green"):("yellow")}
                  onClick={() => act('printdir', { direction: '0' })}
                />
                <Button
                  ml={1}
                  mr={5}
                  disabled={data.rightwall}
                  color={data.printdir === 4 ? ("green"):("yellow")}
                  icon={"chevron-right"}
                  onClick={() => act('printdir', { direction: '4' })}
                />
                <br />
                <Button
                  ml={0.7}
                  mt={0.8}
                  mr={10}
                  disabled={data.belowwall}
                  color={data.printdir === 2 ? ("green"):("yellow")}
                  icon={"chevron-down"}
                  onClick={() => act('printdir', { direction: '2' })}
                />
              </div>
            </Grid.Column>
          </Grid>
          <Flex>
            <Flex.Item>
              <Section title="Categories">
                {data.categories.map((categoryName, i) => (
                  <Button
                    key={categoryName}
                    fluid
                    mr={2}
                    selected={
                      (searchText.length > 1 ? (
                        (categoryName === 'Search' ? 1 : 0)
                      ):(
                        setcategory === categoryName
                      ))
                    }
                    color="transparent"
                    content={categoryName}
                    onClick={(!searchText ? (
                      () => setCategory(categoryName)
                    ):(
                      () => setSearchText("")))}
                  />
                ))}
              </Section>
            </Flex.Item>
            <Flex.Item>
              <Section fluid title={searchText.length > 1 ? "Search Designs" : "Known Designs"} width={50}>
                <div>
                  <Table>
                    {GetMapArr(searchText.length, data.designs).map(design => (
                      <Table.Row key={design.id}>
                        <Table.Cell>
                          <span className={classes(['design32x32', design.id])} style={{ 'vertical-align': 'middle' }} />{' '}
                          <font color={ColorCodeCategory(design.category)}>
                            <b>{design.name}</b>
                          </font>
                        </Table.Cell>
                        <Table.Cell width="150px">
                          {MaxMultiplier(data.stored_materials, design)
                            .map(max => (
                              <Button
                                inline
                                tooltip={max.tooltip}
                                tooltipPosition="bottom"
                                key={max.count}
                                disabled={max.disabled}
                                content={max.count + "x"}
                                onClick={() => act('make', {
                                  item_id: design.id,
                                  multiplier: max.count,
                                })}
                              />
                            ))}
                        </Table.Cell>
                      </Table.Row>
                    ))}
                  </Table>
                </div>

              </Section>
            </Flex.Item>
            <Flex.Item>
              <Section title="Autolathe Queue" width="100vw">
                <NoticeBox ml={1} mr={1} mt={1} mb={1}>
                  {data.isprocessing ? (
                    <font size="3">Processing: {data.processing}</font>
                  ) : (
                    <font size="3">
                      {data.queuelength > 0 ? "Ready to Start" : "Empty"}
                    </font>
                  )}
                </NoticeBox>
                <div><br /></div>
                <font size="2">
                  {data.queue.map(build => (
                    <div key={data.queue.len}>
                      <Grid>
                        <Grid.Column size={0.1} />
                        <Grid.Column size={1.5}>
                          {build.name}
                          {"  x  " + build.multiplier + "   "}
                        </Grid.Column>
                        <Grid.Column>
                          <Button
                            disabled={(build.index === 1)}
                            icon="chevron-up"
                            onClick={() => act('queue_move',
                              { queue_move: -1, index: build.index })}
                          />
                          <Button
                            disabled={(build.index === data.queuelength)}
                            icon="chevron-down"
                            onClick={() => act('queue_move',
                              { queue_move: +1, index: build.index })}
                          />
                          <Button
                            content="Remove"
                            onClick={() => act('remove_from_queue', { index: build.index })}
                          />
                        </Grid.Column>
                        <Grid.Column size={5} />
                      </Grid><br />
                    </div>
                  ))}
                </font>
                <Button
                  disabled={!data.queuelength}
                  content={!data.isprocessing ? ("Process Queue"):("Stop Processing")}
                  onClick={() => act('process_queue')}
                />
                <Button
                  disabled={data.isprocessing}
                  content={"Clear Queue"}
                  onClick={() => act('clear_queue')}
                />
              </Section>
            </Flex.Item>
          </Flex>
        </Section>
      </Window.Content>
    </Window>

  );
};
