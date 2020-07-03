<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis minScale="1e+8" simplifyDrawingTol="1" readOnly="0" simplifyDrawingHints="1" version="3.10.6-A Coruña" labelsEnabled="0" simplifyAlgorithm="0" styleCategories="LayerConfiguration|Symbology|Labeling|Fields|Forms|MapTips|AttributeTable|Rendering|CustomProperties|GeometryOptions" hasScaleBasedVisibilityFlag="0" maxScale="0" simplifyLocal="1" simplifyMaxScale="1">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 type="categorizedSymbol" attr="typ" symbollevels="0" enableorderby="0" forceraster="0">
    <categories>
      <category render="true" symbol="0" value="Kanal" label="Kanal"/>
      <category render="true" symbol="1" value="Stollen" label="Stollen"/>
      <category render="true" symbol="2" value="Verteilleitung" label="Verteilleitung"/>
      <category render="true" symbol="3" value="Zuleitung_Bewaesserung" label="Zuleitung Bewaesserung"/>
    </categories>
    <symbols>
      <symbol alpha="1" type="line" force_rhr="0" name="0" clip_to_extent="1">
        <layer locked="0" enabled="1" class="SimpleLine" pass="0">
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="119,186,226,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.5" k="line_width"/>
          <prop v="MM" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" enabled="1" class="MarkerLine" pass="0">
          <prop v="4" k="average_angle_length"/>
          <prop v="3x:0,0,0,0,0,0" k="average_angle_map_unit_scale"/>
          <prop v="MM" k="average_angle_unit"/>
          <prop v="3" k="interval"/>
          <prop v="3x:0,0,0,0,0,0" k="interval_map_unit_scale"/>
          <prop v="MM" k="interval_unit"/>
          <prop v="0" k="offset"/>
          <prop v="0" k="offset_along_line"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_along_line_map_unit_scale"/>
          <prop v="MM" k="offset_along_line_unit"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="interval" k="placement"/>
          <prop v="0" k="ring_filter"/>
          <prop v="1" k="rotate"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
          <symbol alpha="1" type="marker" force_rhr="0" name="@0@1" clip_to_extent="1">
            <layer locked="0" enabled="1" class="SimpleMarker" pass="0">
              <prop v="0" k="angle"/>
              <prop v="255,0,0,255" k="color"/>
              <prop v="1" k="horizontal_anchor_point"/>
              <prop v="bevel" k="joinstyle"/>
              <prop v="line" k="name"/>
              <prop v="0,0" k="offset"/>
              <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
              <prop v="MM" k="offset_unit"/>
              <prop v="119,186,226,255" k="outline_color"/>
              <prop v="solid" k="outline_style"/>
              <prop v="0.5" k="outline_width"/>
              <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
              <prop v="MM" k="outline_width_unit"/>
              <prop v="diameter" k="scale_method"/>
              <prop v="3" k="size"/>
              <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
              <prop v="MM" k="size_unit"/>
              <prop v="1" k="vertical_anchor_point"/>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" name="name" value=""/>
                  <Option name="properties"/>
                  <Option type="QString" name="type" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol alpha="1" type="line" force_rhr="0" name="1" clip_to_extent="1">
        <layer locked="0" enabled="1" class="SimpleLine" pass="0">
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="255,255,255,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.7" k="line_width"/>
          <prop v="MM" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer locked="0" enabled="1" class="SimpleLine" pass="0">
          <prop v="flat" k="capstyle"/>
          <prop v="1.5;1.5" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="119,186,226,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.7" k="line_width"/>
          <prop v="MM" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="1" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" type="line" force_rhr="0" name="2" clip_to_extent="1">
        <layer locked="0" enabled="1" class="SimpleLine" pass="0">
          <prop v="flat" k="capstyle"/>
          <prop v="1.5;0.5" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="119,186,226,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.5" k="line_width"/>
          <prop v="MM" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="1" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" type="line" force_rhr="0" name="3" clip_to_extent="1">
        <layer locked="0" enabled="1" class="SimpleLine" pass="0">
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="119,186,226,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.5" k="line_width"/>
          <prop v="MM" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <source-symbol>
      <symbol alpha="1" type="line" force_rhr="0" name="0" clip_to_extent="1">
        <layer locked="0" enabled="1" class="SimpleLine" pass="0">
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="119,186,226,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.5" k="line_width"/>
          <prop v="MM" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </source-symbol>
    <colorramp type="randomcolors" name="[source]"/>
    <rotation/>
    <sizescale/>
  </renderer-v2>
  <customproperties>
    <property key="dualview/previewExpressions" value="t_id"/>
    <property key="embeddedWidgets/count" value="0"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <fieldConfiguration>
    <field name="t_id">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="t_ili_tid">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="typ">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="false"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="ilicode"/>
            <Option type="QString" name="Layer" value="bewaesserung_linien_34a14391_e71d_422f_a552_55c3aa275023"/>
            <Option type="QString" name="LayerName" value="Bewässerung Linien"/>
            <Option type="QString" name="LayerProviderName" value="postgres"/>
            <Option type="QString" name="LayerSource" value="service='edit' key='itfcode' checkPrimaryKeyUnicity='1' table=&quot;alw_strukturverbesserungen&quot;.&quot;bewaesserung_linien&quot; sql="/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="true"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="dispname"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="bautyp">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="false"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="ilicode"/>
            <Option type="QString" name="Layer" value="bautyp_d497279f_38cd_424f_97e1_be7a70b2b74e"/>
            <Option type="QString" name="LayerName" value="Bautyp"/>
            <Option type="QString" name="LayerProviderName" value="postgres"/>
            <Option type="QString" name="LayerSource" value="service='edit' key='itfcode' checkPrimaryKeyUnicity='1' table=&quot;alw_strukturverbesserungen&quot;.&quot;bautyp&quot; sql="/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="true"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="dispname"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="astatus">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="false"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="ilicode"/>
            <Option type="QString" name="Layer" value="astatus_8c9aab94_4b62_4ec0_ae4a_4387a26bd61a"/>
            <Option type="QString" name="LayerName" value="Status"/>
            <Option type="QString" name="LayerProviderName" value="postgres"/>
            <Option type="QString" name="LayerSource" value="service='edit' key='itfcode' checkPrimaryKeyUnicity='1' table=&quot;alw_strukturverbesserungen&quot;.&quot;astatus&quot; sql="/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="true"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="dispname"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="status_datum">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option type="bool" name="allow_null" value="true"/>
            <Option type="bool" name="calendar_popup" value="true"/>
            <Option type="QString" name="display_format" value="dd.MM.yyyy"/>
            <Option type="QString" name="field_format" value="yyyy-MM-dd"/>
            <Option type="bool" name="field_iso_format" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="bauabnahme_datum">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option type="bool" name="allow_null" value="true"/>
            <Option type="bool" name="calendar_popup" value="true"/>
            <Option type="QString" name="display_format" value="dd.MM.yyyy"/>
            <Option type="QString" name="field_format" value="yyyy-MM-dd"/>
            <Option type="bool" name="field_iso_format" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="werksid">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="unterhaltsid">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="projekt">
      <editWidget type="RelationReference">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowAddFeatures" value="false"/>
            <Option type="bool" name="AllowNULL" value="false"/>
            <Option type="bool" name="MapIdentification" value="true"/>
            <Option type="bool" name="OrderByValue" value="true"/>
            <Option type="bool" name="ReadOnly" value="false"/>
            <Option type="QString" name="Relation" value="raeumlichlmnt_bwssrng_lnie_projekt_fkey"/>
            <Option type="bool" name="ShowForm" value="false"/>
            <Option type="bool" name="ShowOpenFormButton" value="true"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="werkeigentum">
      <editWidget type="RelationReference">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowAddFeatures" value="true"/>
            <Option type="bool" name="AllowNULL" value="true"/>
            <Option type="bool" name="MapIdentification" value="false"/>
            <Option type="bool" name="OrderByValue" value="true"/>
            <Option type="bool" name="ReadOnly" value="false"/>
            <Option type="QString" name="Relation" value="raeumlichlmnt_bwssrng_lnie_werkeigentum_fkey"/>
            <Option type="bool" name="ShowForm" value="false"/>
            <Option type="bool" name="ShowOpenFormButton" value="true"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="t_id" name="" index="0"/>
    <alias field="t_ili_tid" name="" index="1"/>
    <alias field="typ" name="Typ Bewässerung Linie" index="2"/>
    <alias field="bautyp" name="Bautyp" index="3"/>
    <alias field="astatus" name="Status" index="4"/>
    <alias field="status_datum" name="Datum Status" index="5"/>
    <alias field="bauabnahme_datum" name="Datum Bauabnahme" index="6"/>
    <alias field="werksid" name="WerksID" index="7"/>
    <alias field="unterhaltsid" name="UnterhaltsID" index="8"/>
    <alias field="projekt" name="Projekt" index="9"/>
    <alias field="werkeigentum" name="Werkeigentum" index="10"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default field="t_id" applyOnUpdate="0" expression=""/>
    <default field="t_ili_tid" applyOnUpdate="0" expression=""/>
    <default field="typ" applyOnUpdate="0" expression="'Zuleitung_Bewaesserung'"/>
    <default field="bautyp" applyOnUpdate="0" expression="'Neubau'"/>
    <default field="astatus" applyOnUpdate="0" expression="'projektiert'"/>
    <default field="status_datum" applyOnUpdate="0" expression="format_date(now(), 'yyyy-MM-dd')"/>
    <default field="bauabnahme_datum" applyOnUpdate="0" expression=""/>
    <default field="werksid" applyOnUpdate="0" expression=""/>
    <default field="unterhaltsid" applyOnUpdate="0" expression=""/>
    <default field="projekt" applyOnUpdate="0" expression=""/>
    <default field="werkeigentum" applyOnUpdate="0" expression=""/>
  </defaults>
  <constraints>
    <constraint field="t_id" exp_strength="0" notnull_strength="1" unique_strength="1" constraints="3"/>
    <constraint field="t_ili_tid" exp_strength="0" notnull_strength="0" unique_strength="0" constraints="0"/>
    <constraint field="typ" exp_strength="0" notnull_strength="1" unique_strength="0" constraints="1"/>
    <constraint field="bautyp" exp_strength="0" notnull_strength="1" unique_strength="0" constraints="1"/>
    <constraint field="astatus" exp_strength="2" notnull_strength="1" unique_strength="0" constraints="5"/>
    <constraint field="status_datum" exp_strength="1" notnull_strength="1" unique_strength="0" constraints="5"/>
    <constraint field="bauabnahme_datum" exp_strength="1" notnull_strength="0" unique_strength="0" constraints="4"/>
    <constraint field="werksid" exp_strength="1" notnull_strength="0" unique_strength="0" constraints="4"/>
    <constraint field="unterhaltsid" exp_strength="1" notnull_strength="0" unique_strength="0" constraints="4"/>
    <constraint field="projekt" exp_strength="0" notnull_strength="0" unique_strength="0" constraints="0"/>
    <constraint field="werkeigentum" exp_strength="0" notnull_strength="0" unique_strength="0" constraints="0"/>
  </constraints>
  <constraintExpressions>
    <constraint field="t_id" desc="" exp=""/>
    <constraint field="t_ili_tid" desc="" exp=""/>
    <constraint field="typ" desc="" exp=""/>
    <constraint field="bautyp" desc="" exp=""/>
    <constraint field="astatus" desc="" exp="&quot;t_id&quot;"/>
    <constraint field="status_datum" desc="Datum Status muss zwischen 1.1.1800 und 31.12.2099 liegen." exp="status_datum IS NULL or (status_datum >= to_date('1800-01-01') and status_datum &lt;= to_date('2099-12-31'))"/>
    <constraint field="bauabnahme_datum" desc="Datum Bauabnahme muss zwischen 1.1.1800 und 31.12.2099 liegen." exp="bauabnahme_datum IS NULL or (bauabnahme_datum >= to_date('1800-01-01') and bauabnahme_datum &lt;= to_date('2099-12-31'))"/>
    <constraint field="werksid" desc="WerksID darf maximal 20 Zeichen lang sein." exp="werksid IS NULL OR length(werksid) &lt;= 20"/>
    <constraint field="unterhaltsid" desc="Die UnterhaltsID darf maximal 20 Zeichen lang sein." exp="unterhaltsid IS NULL OR length(unterhaltsid) &lt;= 20"/>
    <constraint field="projekt" desc="" exp=""/>
    <constraint field="werkeigentum" desc="" exp=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributetableconfig sortOrder="0" sortExpression="" actionWidgetStyle="dropDown">
    <columns>
      <column type="field" hidden="0" name="t_id" width="-1"/>
      <column type="field" hidden="0" name="t_ili_tid" width="-1"/>
      <column type="field" hidden="0" name="typ" width="-1"/>
      <column type="field" hidden="0" name="bautyp" width="-1"/>
      <column type="field" hidden="0" name="astatus" width="-1"/>
      <column type="field" hidden="0" name="status_datum" width="-1"/>
      <column type="field" hidden="0" name="bauabnahme_datum" width="-1"/>
      <column type="field" hidden="0" name="werksid" width="-1"/>
      <column type="field" hidden="0" name="unterhaltsid" width="-1"/>
      <column type="field" hidden="0" name="projekt" width="-1"/>
      <column type="field" hidden="0" name="werkeigentum" width="-1"/>
      <column type="actions" hidden="1" width="-1"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <storedexpressions/>
  <editform tolerant="1"></editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
QGIS forms can have a Python function that is called when the form is
opened.

Use this function to add extra logic to your forms.

Enter the name of the function in the "Python Init function"
field.
An example follows:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>tablayout</editorlayout>
  <attributeEditorForm>
    <attributeEditorContainer groupBox="0" showLabel="1" name="Bewässerung Linie" visibilityExpressionEnabled="0" columnCount="2" visibilityExpression="">
      <attributeEditorField showLabel="1" name="typ" index="2"/>
      <attributeEditorField showLabel="1" name="bautyp" index="3"/>
      <attributeEditorField showLabel="1" name="astatus" index="4"/>
      <attributeEditorField showLabel="1" name="status_datum" index="5"/>
      <attributeEditorField showLabel="1" name="bauabnahme_datum" index="6"/>
      <attributeEditorField showLabel="1" name="projekt" index="9"/>
      <attributeEditorField showLabel="1" name="werksid" index="7"/>
      <attributeEditorField showLabel="1" name="werkeigentum" index="10"/>
      <attributeEditorField showLabel="1" name="unterhaltsid" index="8"/>
    </attributeEditorContainer>
    <attributeEditorContainer groupBox="0" showLabel="1" name="Genossenschaft" visibilityExpressionEnabled="0" columnCount="1" visibilityExpression="">
      <attributeEditorRelation relation="raemlchlmnt_gsnschft_lment_elemnt_gnssns_bwssrng_lnie_fkey" showUnlinkButton="1" showLabel="0" showLinkButton="1" name="raemlchlmnt_gsnschft_lment_elemnt_gnssns_bwssrng_lnie_fkey"/>
    </attributeEditorContainer>
    <attributeEditorContainer groupBox="0" showLabel="1" name="Debugging" visibilityExpressionEnabled="1" columnCount="2" visibilityExpression="eval(@debugging)">
      <attributeEditorField showLabel="1" name="t_ili_tid" index="1"/>
      <attributeEditorField showLabel="1" name="t_id" index="0"/>
    </attributeEditorContainer>
  </attributeEditorForm>
  <editable>
    <field name="astatus" editable="1"/>
    <field name="bauabnahme_datum" editable="1"/>
    <field name="bautyp" editable="1"/>
    <field name="projekt" editable="1"/>
    <field name="status_datum" editable="1"/>
    <field name="t_id" editable="1"/>
    <field name="t_ili_tid" editable="1"/>
    <field name="typ" editable="1"/>
    <field name="unterhaltsid" editable="1"/>
    <field name="werkeigentum" editable="1"/>
    <field name="werksid" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="astatus" labelOnTop="0"/>
    <field name="bauabnahme_datum" labelOnTop="0"/>
    <field name="bautyp" labelOnTop="0"/>
    <field name="projekt" labelOnTop="0"/>
    <field name="status_datum" labelOnTop="0"/>
    <field name="t_id" labelOnTop="0"/>
    <field name="t_ili_tid" labelOnTop="0"/>
    <field name="typ" labelOnTop="0"/>
    <field name="unterhaltsid" labelOnTop="0"/>
    <field name="werkeigentum" labelOnTop="0"/>
    <field name="werksid" labelOnTop="0"/>
  </labelOnTop>
  <widgets>
    <widget name="raemlchlmnt_gsnschft_lment_elemnt_gnssns_bwssrng_lnie_fkey">
      <config type="Map">
        <Option type="QString" name="nm-rel" value="raemlchlmnt_gsnschft_lment_genossenschaft_element_fkey"/>
      </config>
    </widget>
  </widgets>
  <previewExpression>typ || COALESCE(' (' || t_id || ', ' || bautyp || ')','')</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>1</layerGeometryType>
</qgis>
