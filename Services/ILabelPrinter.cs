namespace Linn.Common.Domain.LinnApps.Services;

using System.Threading.Tasks;

public interface ILabelPrinter
{
    Task<(bool Success, string Message)> PrintLabelsAsync(
        string fileName,
        string printer,
        int qty,
        string template,
        string data);
}
