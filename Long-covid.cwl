cwlVersion: v1.0
steps:
  covid19-result---tadds-exclude:
    run: covid19-result---tadds-exclude.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
      potentialCases:
        id: potentialCases
        source: potentialCases
  positive-covid19---tadds-exclude:
    run: positive-covid19---tadds-exclude.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: covid19-result---tadds-exclude/output
  covid19-exposure---tadds-exclude:
    run: covid19-exposure---tadds-exclude.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: positive-covid19---tadds-exclude/output
  covid19-suspected---tadds-exclude:
    run: covid19-suspected---tadds-exclude.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: covid19-exposure---tadds-exclude/output
  covid19-confirmed---tadds-exclude:
    run: covid19-confirmed---tadds-exclude.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: covid19-suspected---tadds-exclude/output
  covid19-coronavirus---tadds-exclude:
    run: covid19-coronavirus---tadds-exclude.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: covid19-confirmed---tadds-exclude/output
  covid19---tadds-exclude:
    run: covid19---tadds-exclude.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: covid19-coronavirus---tadds-exclude/output
  long-covid---tadds:
    run: long-covid---tadds.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: covid19---tadds-exclude/output
  long-covid-assessment---tadds:
    run: long-covid-assessment---tadds.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: long-covid---tadds/output
  output-long-covid-without-a-record-of-covid19-cases:
    run: output-long-covid-without-a-record-of-covid19-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: long-covid-assessment---tadds/output
class: Workflow
inputs:
  potentialCases:
    id: potentialCases
    doc: Input of potential cases for processing
    type: File
  inputModule1:
    id: inputModule1
    doc: Python implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
outputs:
  output:
    id: output
    type: File
    outputSource: output-long-covid-without-a-record-of-covid19-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
