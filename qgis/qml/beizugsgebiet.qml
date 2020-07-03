<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.10.7-A Coruña" hasScaleBasedVisibilityFlag="0" styleCategories="LayerConfiguration|Symbology|Labeling|Fields|Forms|MapTips|AttributeTable|Rendering|CustomProperties|GeometryOptions" labelsEnabled="0" minScale="1e+8" simplifyMaxScale="1" maxScale="0" simplifyDrawingTol="1" readOnly="0" simplifyAlgorithm="0" simplifyLocal="1" simplifyDrawingHints="1">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 symbollevels="0" forceraster="0" type="singleSymbol" enableorderby="0">
    <symbols>
      <symbol clip_to_extent="1" alpha="1" name="0" force_rhr="0" type="fill">
        <layer locked="0" class="PointPatternFill" enabled="1" pass="0">
          <prop k="displacement_x" v="1.125"/>
          <prop k="displacement_x_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="displacement_x_unit" v="MM"/>
          <prop k="displacement_y" v="0"/>
          <prop k="displacement_y_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="displacement_y_unit" v="MM"/>
          <prop k="distance_x" v="2.5"/>
          <prop k="distance_x_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="distance_x_unit" v="MM"/>
          <prop k="distance_y" v="1.5"/>
          <prop k="distance_y_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="distance_y_unit" v="MM"/>
          <prop k="offset_x" v="0"/>
          <prop k="offset_x_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_x_unit" v="MM"/>
          <prop k="offset_y" v="0"/>
          <prop k="offset_y_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_y_unit" v="MM"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
          <symbol clip_to_extent="1" alpha="1" name="@0@0" force_rhr="0" type="marker">
            <layer locked="0" class="SimpleMarker" enabled="1" pass="0">
              <prop k="angle" v="0"/>
              <prop k="color" v="175,126,72,255"/>
              <prop k="horizontal_anchor_point" v="1"/>
              <prop k="joinstyle" v="bevel"/>
              <prop k="name" v="circle"/>
              <prop k="offset" v="0,0"/>
              <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="offset_unit" v="MM"/>
              <prop k="outline_color" v="35,35,35,255"/>
              <prop k="outline_style" v="no"/>
              <prop k="outline_width" v="0"/>
              <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="outline_width_unit" v="MM"/>
              <prop k="scale_method" v="diameter"/>
              <prop k="size" v="0.5"/>
              <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="size_unit" v="MM"/>
              <prop k="vertical_anchor_point" v="1"/>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" name="name" type="QString"/>
                  <Option name="properties"/>
                  <Option value="collection" name="type" type="QString"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
        <layer locked="0" class="SimpleLine" enabled="1" pass="0">
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="175,126,72,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.6"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="ring_filter" v="0"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <rotation/>
    <sizescale/>
  </renderer-v2>
  <customproperties>
    <property value="t_id || ' ' || represent_value(typ) || COALESCE(' (' || datum_nachfuehrung || ')','')" key="dualview/previewExpressions"/>
    <property value="0" key="embeddedWidgets/count"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
    <activeChecks/>
    <checkConfiguration type="Map">
      <Option name="QgsGeometryGapCheck" type="Map">
        <Option value="0" name="allowedGapsBuffer" type="double"/>
        <Option value="false" name="allowedGapsEnabled" type="bool"/>
        <Option value="" name="allowedGapsLayer" type="QString"/>
      </Option>
    </checkConfiguration>
  </geometryOptions>
  <fieldConfiguration>
    <field name="t_id">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="t_ili_tid">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="datum_nachfuehrung">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option value="true" name="allow_null" type="bool"/>
            <Option value="true" name="calendar_popup" type="bool"/>
            <Option value="dd.MM.yyyy" name="display_format" type="QString"/>
            <Option value="yyyy-MM-dd" name="field_format" type="QString"/>
            <Option value="false" name="field_iso_format" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="typ">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" name="AllowMulti" type="bool"/>
            <Option value="false" name="AllowNull" type="bool"/>
            <Option value="" name="FilterExpression" type="QString"/>
            <Option value="ilicode" name="Key" type="QString"/>
            <Option value="beizugsgebiete_431dfba8_c143_488b_a93a_7616ffb09f6e" name="Layer" type="QString"/>
            <Option value="Beizugsgebiete" name="LayerName" type="QString"/>
            <Option value="postgres" name="LayerProviderName" type="QString"/>
            <Option value="service='edit' key='itfcode' checkPrimaryKeyUnicity='1' table=&quot;alw_strukturverbesserungen&quot;.&quot;beizugsgebiete&quot; sql=" name="LayerSource" type="QString"/>
            <Option value="1" name="NofColumns" type="int"/>
            <Option value="true" name="OrderByValue" type="bool"/>
            <Option value="false" name="UseCompleter" type="bool"/>
            <Option value="dispname" name="Value" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="t_id" index="0" name="TID"/>
    <alias field="t_ili_tid" index="1" name=""/>
    <alias field="datum_nachfuehrung" index="2" name="Datum Nachführung"/>
    <alias field="typ" index="3" name="Beizugstyp"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default expression="" field="t_id" applyOnUpdate="0"/>
    <default expression="" field="t_ili_tid" applyOnUpdate="0"/>
    <default expression="" field="datum_nachfuehrung" applyOnUpdate="0"/>
    <default expression="'Alter_Bestand'" field="typ" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint constraints="3" unique_strength="1" notnull_strength="1" field="t_id" exp_strength="0"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" field="t_ili_tid" exp_strength="0"/>
    <constraint constraints="4" unique_strength="0" notnull_strength="0" field="datum_nachfuehrung" exp_strength="2"/>
    <constraint constraints="1" unique_strength="0" notnull_strength="1" field="typ" exp_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint field="t_id" exp="" desc=""/>
    <constraint field="t_ili_tid" exp="" desc=""/>
    <constraint field="datum_nachfuehrung" exp="datum_nachfuehrung IS NULL or (datum_nachfuehrung >= to_date('1800-01-01') and datum_nachfuehrung &lt;= to_date('2099-12-31'))" desc="Datum Nachführung muss zwischen 1.1.1800 und 31.12.2099 liegen."/>
    <constraint field="typ" exp="" desc=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributetableconfig actionWidgetStyle="dropDown" sortExpression="" sortOrder="0">
    <columns>
      <column width="-1" name="t_id" type="field" hidden="0"/>
      <column width="-1" name="t_ili_tid" type="field" hidden="0"/>
      <column width="-1" name="datum_nachfuehrung" type="field" hidden="0"/>
      <column width="-1" name="typ" type="field" hidden="0"/>
      <column width="-1" type="actions" hidden="1"/>
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
    <attributeEditorContainer columnCount="2" groupBox="0" name="Allgemein" visibilityExpressionEnabled="0" showLabel="1" visibilityExpression="">
      <attributeEditorField name="typ" index="3" showLabel="1"/>
      <attributeEditorField name="datum_nachfuehrung" index="2" showLabel="1"/>
    </attributeEditorContainer>
    <attributeEditorContainer columnCount="2" groupBox="0" name="Projekt" visibilityExpressionEnabled="0" showLabel="1" visibilityExpression="">
      <attributeEditorRelation name="raemlchlmnt_bzgsgbt_prjekt_beizugsgebiet_fkey" showUnlinkButton="1" showLabel="0" showLinkButton="1" relation="raemlchlmnt_bzgsgbt_prjekt_beizugsgebiet_fkey"/>
    </attributeEditorContainer>
    <attributeEditorContainer columnCount="2" groupBox="0" name="Debugging" visibilityExpressionEnabled="1" showLabel="1" visibilityExpression="CASE WHEN @debugging = 'true' THEN true ELSE false END">
      <attributeEditorField name="t_id" index="0" showLabel="1"/>
      <attributeEditorField name="t_ili_tid" index="1" showLabel="1"/>
    </attributeEditorContainer>
  </attributeEditorForm>
  <editable>
    <field name="datum_nachfuehrung" editable="1"/>
    <field name="t_id" editable="0"/>
    <field name="t_ili_tid" editable="0"/>
    <field name="typ" editable="1"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="datum_nachfuehrung"/>
    <field labelOnTop="0" name="t_id"/>
    <field labelOnTop="0" name="t_ili_tid"/>
    <field labelOnTop="0" name="typ"/>
  </labelOnTop>
  <widgets>
    <widget name="raemlchlmnt_bzgsgbt_prjekt_beizugsgebiet_fkey">
      <config type="Map">
        <Option value="raemlchlmnt_bzgsgbt_prjekt_projekt_fkey" name="nm-rel" type="QString"/>
      </config>
    </widget>
  </widgets>
  <previewExpression>'Beizugsgebiet, ' || represent_value(typ) || COALESCE(' (' || t_id || COALESCE(', ' || datum_nachfuehrung,'') || ')','')</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>2</layerGeometryType>
</qgis>
