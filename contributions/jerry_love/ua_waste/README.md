# National Waste List of Ukraine

Author: Jerry Love  
Dataset: [https://data.gov.ua/dataset/natsionalnii-perelik-vidkhodiv](https://data.gov.ua/en/dataset/2169b5a5-7255-4631-89c0-7bfc859e283b/resource/26735f3e-02c8-48ba-932d-e4e8962dae63)

## Description
This visualization presents the distribution of waste across different chapters and subchapters in the Ukrainian National Waste List (natsionalnii-perelik-vidkhodiv). It highlights which waste categories have the most subcategories, providing an overview of the complexity of waste classification.  

Two visualizations were created:  
- Sunburst chart: showing hierarchical relationships between chapters, subchapters, and general categories.  
- Horizontal bar graph: showing the number of subchapters per chapter.  

## Methods
1. Dataset Selection: The dataset was chosen at random from the Open Data Portal of Ukraine.
2. Translation: The original dataset was translated from Ukrainian to English using Grok.  
3. Data Analysis: The dataset was cleaned, sorted, and categorized in Excel.  
4. Categorization: General categories were created for each waste type to simplify visualization and highlight trends.  
5. Visualization: Charts were generated to show hierarchical relationships and subchapter distributions clearly.

## Tools used
- Excel (data cleaning, sorting, and categorization)  
- R (tidyverse: dplyr, ggplot2, readr, viridis)
- Data source: Open Data Portal of Ukraine

## License
- Code: MIT License  
- Visualizations: CC BY 4.0
