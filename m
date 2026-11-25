Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601462;
	b=qg7/9mMbCGFzBBbBNGzKa3KVIEnJzAk0lgv81QNdJ+dVEueNb6oc0iIKhQt18l9uwkuH
	 /pN0KQk5MpVMG9kLCH8y0ZRia1aqfammArGNW3raMg7QFonpLz6EiQkjQ6ZO3swF5TrvE
	 CSL773hJj4BhqeAde8NAzgVlusw7ciE1vhFF3AMAsDhi1Ki65aJny2rn6k3RkCVrrFYw4
	 ngMYgg90QsBCvi6i0gZK21LVIC8zgp/yTR6qEOPV3jhXLBLLe3xlptWrV09c1N88xEU6u
	 WJ2Mf9/qktxfyoPuIR8w86v2IQDJr/y2kPIhXOMnYGIvRB5O5/cAECVUovJVWbaBy6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601462;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=BaF2y941KHDdVq/TCyzQzvb+LdOgdRdyfJjxbTxcEfE=;
	b=Sce1suvtGxCouipP0zIZt3CDABnDAw7h0DlS9alqLxq5PgagkcKSGEDo1ix7joMgMqz+
	 tYT9bE4lOI2a6ZnkO2H6XvEZbLX/eUOc3RgkrYQcsFILappgP22F1RqdNoIWHq36pLX/G
	 fmN0EcYvRmRAJCm/h8TxD2xHdxKUrnFIJuuMQbbcvfORASECpEYVOROJlnAGdzsda5YMl
	 wMWR2/nY1WnzZBII5t88tSo7tOM9eIfzvxwxZdeQ7xSZYD0Xer3pzZTQqTOJp/cYATm0P
	 fZWaj6xQj57i7emurZ85dBf94hwYM/CHsSJfOgZIUc1+3SxqbthxG5+wT9we4xOSPvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VnHfrSIT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8420606A31E;
	Wed, 25 Nov 2026 10:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VnHfrSIT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E45121F000C6;
	Wed, 25 Nov 2026 10:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795601462;
	bh=BaF2y941KHDdVq/TCyzQzvb+LdOgdRdyfJjxbTxcEfE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VnHfrSITWV9Ws1hlo2hFlxZlsLTRcWeJRZjMNpyg1FXRnzV4vsCAShBP61Ocx1zhP
	 HXCddZyw9ddGjL3vPqHptfCA16EWst0mQdqKWS0CC2UCkVU629Ra0UHfY0RfQX82FF
	 p3gylN9hDN/QG0SgaFHaGtP12i58WCnHIlx+7KWdzhFN/x9qRz8VYI7jlUzz7n85w+
	 G9JxwhlsqYHaGZyXggFi9vOaOxUg4+85XPglls1q366nyKsvlIRi/dBOhOMXOZLqyu
	 hT486ffaUn+42UkmkQtqtkizkm3YDtYoVYQumDoYpC2FCZDmnq1AJZjrZO+QAA/TJd
	 5Be4atrOMSApw==
Subject:
 Re: [PATCH net-next 2/2] bnge: Add support for ethtool -d register dump
From: netdev-bot+sashiko@kernel.org
To: ramakrishna.koduri@broadcom.com
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 vsrama-krishna.nemani@broadcom.com, vikas.gupta@broadcom.com,
 bhargava.marreddy@broadcom.com, ajit.khaparde@broadcom.com,
 dharmender.garg@broadcom.com, kumar.mudide@broadcom.com
Date: Wed, 25 Nov 2026 10:11:01 +0000
Message-ID: <179560146141.3135.3852070914350759699@kernel.org>
In-Reply-To: <20261124100751.179270-3-ramakrishna.koduri@broadcom.com>
References: <20261124100751.179270-3-ramakrishna.koduri@broadcom.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] bnge_get_pcie_regs() sets regs->version to 1, 2 or 3 from the
  PCIe stats size firmware actually returned (`min(resp->pcie_stat_size,…
- [Low] In bnge_hwrm_dbg_qcaps()
  (drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c), the comment says…
- [Low] The commit message lists only the categories of data that are
  dumped.
- [Low] In bnge_pcie_reg[]
  (drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c, line 786),…

--

bnge: Add support for ethtool -d register dump

This commit adds get_regs and get_regs_len ethtool callbacks to the bnge
driver. The dump has three parts: PXP registers read through
HWRM_DBG_READ_DIRECT, PCIe statistics from HWRM_PCIE_QSTATS, and adaptive
QoS RX/TX MBUF data. It also adds HWRM_DBG_QCAPS discovery at probe time and
reads new capability flags from FUNC_QCAPS.

> Implement get_regs and get_regs_len ethtool callbacks to provide
> register dump support for the BNGE driver. This includes support
> for PXP registers, PCIe signal integrity, PCIe Latency Histogram
> and Adaptive QoS TX/RX MBUF registers.

[Severity: Low]
Could the commit message describe the dump layout and the version numbers?
Both become visible to userspace once this is merged.

The layout is:

- PXP registers at offset 0
- PCIe stats at BNGE_PXP_REG_LEN (0x3110)
- RX MBUF data at 0x3800
- TX MBUF data at:

#define BNGE_TX_MBUF_REG_OFFSET	(BNGE_RX_MBUF_REG_OFFSET + 0x64 + \
				 sizeof(struct queue_adptv_qos_rx_info))

What is the 0x64 byte gap between the RX and TX blocks? BNGE_MBUF_REG_LEN
(0x12c) seems to include it.

regs->version can be anything from 0 to 4, and version 4 does not exist in
bnxt. The comment in bnge_get_regs() says "Version 4 is required for the
userspace ethtool decoder". DRV_NAME is "bng_en", though, so ethtool will not
use its existing bnxt decoder. Is a bng_en decoder available or planned?

The patch also adds a new HWRM_DBG_QCAPS query at probe time, through
bnge_func_qcaps()->bnge_hwrm_dbg_qcaps(). The commit message doesn't mention
this either.

> diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c b/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
> index 2467e44de291a..3ada50832c6d9 100644
> --- a/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
> +++ b/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c

[ ... ]

> @@ -740,6 +742,170 @@ static int bnge_set_pauseparam(struct net_device *dev,

[ ... ]

> +#define BNGE_PCIE_REG_SIZE(reg)		\
> +	sizeof_field(struct pcie_ctx_hw_stats_v2, pcie_##reg)
> +
> +static const struct bnge_reg_desc bnge_pcie_reg[] = {
> +	{ BNGE_PCIE_REG_SIZE(pl_signal_integrity), 8 },
> +	{ sizeof(__le16), 4 }, /* pcie_equalization_time: 4x __le16 */

[Severity: Low]
Does this entry match the HSI definition? include/linux/bnge/hsi.h declares
the field as a single 64-bit value, in both pcie_ctx_hw_stats and
pcie_ctx_hw_stats_v2:

	__le64	pcie_equalization_time;

Every other entry in this table takes its size from the struct through
BNGE_PCIE_REG_SIZE(). This one hardcodes 2 bytes instead.

The difference shows up on big-endian hosts. Converting four __le16 values
swaps the bytes inside each 16-bit part but leaves the parts in their
original order. A single le64_to_cpu() also reverses the order of the parts.
bnxt_get_regs() converts this field as one u64.

Should the HSI describe the field as __le16[4]? Or should this entry use
BNGE_PCIE_REG_SIZE(equalization_time) with a count of 1?

> +	{ BNGE_PCIE_REG_SIZE(ltssm_histogram[0]), 4 },
> +	{ BNGE_PCIE_REG_SIZE(recovery_histogram), 1 },
> +	{ BNGE_PCIE_REG_SIZE(tl_credit_nph_histogram[0]), 94 },
> +	{ BNGE_PCIE_REG_SIZE(posted_packet_count), 5 },
> +	{ BNGE_PCIE_REG_SIZE(rd_latency_histogram[0]), 14 },
> +};

[ ... ]

> +static void bnge_get_pcie_regs(struct bnge_dev *bd, struct ethtool_regs *regs,
> +			       u8 *dst)
> +{

[ ... ]

> +	len = min_t(int, le16_to_cpu(resp->pcie_stat_size),
> +		    sizeof(struct pcie_ctx_hw_stats_v2));
> +	if (len <= 0)
> +		goto drop_req;
> +
> +	if (len <= sizeof(struct pcie_ctx_hw_stats))
> +		regs->version = 1;
> +	else if (len < sizeof(struct pcie_ctx_hw_stats_v2))
> +		regs->version = 2;
> +	else
> +		regs->version = 3;

[ ... ]

> +static void bnge_get_regs(struct net_device *dev, struct ethtool_regs *regs,
> +			  void *_p)
> +{
> +	struct bnge_net *bn = netdev_priv(dev);
> +	struct bnge_dev *bd = bn->bd;
> +	u8 *p = _p;
> +
> +	regs->version = 0;
> +
> +	if (BNGE_NO_FW_ACCESS(bd))
> +		return;
> +
> +	if (!(bd->fw_dbg_cap & DBG_QCAPS_RESP_FLAGS_REG_ACCESS_RESTRICTED)) {
> +		int rc;
> +
> +		rc = bnge_dbg_hwrm_rd_reg(bd, 0, BNGE_PXP_REG_LEN / 4, _p);
> +		if (rc)
> +			netdev_warn(dev, "Failed to read PXP regs: %d\n", rc);
> +	}
> +
> +	if (bd->stats_cap & BNGE_STATS_CAP_PCIE)
> +		bnge_get_pcie_regs(bd, regs, p + BNGE_PXP_REG_LEN);
> +
> +	if (bd->fw_cap & BNGE_FW_CAP_MBUF_DATA) {
> +		int rc_rx, rc_tx;

[ ... ]

> +		rc_rx = bnge_hwrm_rx_mbuf_data(bd,
> +					       p + BNGE_RX_MBUF_REG_OFFSET);
> +		rc_tx = bnge_hwrm_tx_mbuf_data(bd,
> +					       p + BNGE_TX_MBUF_REG_OFFSET);
> +		if (!rc_rx || !rc_tx)
> +			regs->version = 4;

[Severity: Medium]
Doesn't this assignment throw away the PCIe layout version that
bnge_get_pcie_regs() just set?

bnge_get_pcie_regs() picks version 1, 2 or 3 from the size firmware returned
in resp->pcie_stat_size. That version is the only thing that tells userspace
how much of the PCIe region holds real data.

If BNGE_FW_CAP_MBUF_DATA is set and either MBUF query succeeds, the version
becomes 4. That happens in all of these cases:

- the PCIe stats were v1 sized
- the PCIe stats were v2 sized or full v2
- HWRM_PCIE_QSTATS failed
- PCIe stats were never queried because BNGE_STATS_CAP_PCIE isn't set

The ethtool core zero-fills the buffer. A decoder that sees version 4 would
treat the unwritten tail as real TL credit and latency histogram values.
bnxt_get_regs() uses the same 1/2/3 scheme but never overwrites it.

A related point: when bnge_dbg_hwrm_rd_reg() fails, the only sign is the
netdev_warn() above. The zeroed 0x3110 byte PXP region is still reported as
register contents, and neither version nor len tells userspace about the
failure. bnxt behaves the same way today.

> +	}
> +}

[ ... ]

> diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c b/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c
> index 227de771f2ef6..9b8cb39dbe164 100644
> --- a/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c
> +++ b/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c

[ ... ]

> @@ -597,12 +598,45 @@ int bnge_hwrm_func_resc_qcaps(struct bnge_dev *bd)
>  	return rc;
>  }
>  
> +void bnge_hwrm_dbg_qcaps(struct bnge_dev *bd)
> +{
> +	struct hwrm_dbg_qcaps_output *resp;
> +	struct hwrm_dbg_qcaps_input *req;
> +	int rc;
> +
> +	bd->fw_dbg_cap = 0;
> +	if (!(bd->fw_cap & BNGE_FW_CAP_DBG_QCAPS))
> +		return;
> +
> +	/* Discovery failure is treated as restricted so we never attempt
> +	 * direct register reads without confirmation from firmware.
> +	 */

[Severity: Low]
Does the early return above match this comment? If firmware doesn't advertise
FUNC_QCAPS_RESP_FLAGS_DBG_QCAPS_CMD_SUPPORTED, fw_dbg_cap stays 0.
bnge_get_regs() only checks the restricted bit:

	if (!(bd->fw_dbg_cap & DBG_QCAPS_RESP_FLAGS_REG_ACCESS_RESTRICTED)) {
		...
		rc = bnge_dbg_hwrm_rd_reg(bd, 0, BNGE_PXP_REG_LEN / 4, _p);

So HWRM_DBG_READ_DIRECT is sent for 0xc44 words in exactly the case where
firmware has confirmed the least. If firmware rejects the request, every
ethtool -d logs "Failed to read PXP regs".

bnxt_hwrm_dbg_qcaps() also treats missing DBG_QCAPS as unrestricted. Should
the comment be changed to match? Or should this branch also set
DBG_QCAPS_RESP_FLAGS_REG_ACCESS_RESTRICTED?

> +	rc = bnge_hwrm_req_init(bd, req, HWRM_DBG_QCAPS);
> +	if (rc) {
> +		bd->fw_dbg_cap = DBG_QCAPS_RESP_FLAGS_REG_ACCESS_RESTRICTED;
> +		return;
> +	}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124100751.179270-1-ramakrishna.koduri%40broadcom.com
