Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.148.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795078491;
	b=fy8+QU3HMGwVosbRyeA0zXCpWF60hk/i5PVS6GxSopt/u+X3Mi+RcWMp+gjhosAKxgj/
	 wgB7S2AjCv9cKHLFs5aEYEBIw1LnIL+4pEkFGV+vqwO+xHzJZ9Fupy6+bAyMIVgPyn6Ql
	 3vGrARzN/kR4Vzh7KscHIuimNKCHTyJxTMQaemShICR3IxS45H5kLk0iG8oKRWUplBlko
	 XucQHCytsBi/LqBOc1K82T6TQrZ+kkk34EvflODJRJN9cYyw7CuRInbbTmrBICJcvZDBZ
	 51xRfe/Ot/m9guGGef+Qc7VSeVc7ua7GhgTmrsUpGl+xZ8HzMoRv3TMIzg3ZG9OEsKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078491;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version;
	bh=64Bnh0XnQvHfVPMjYIHDspfblr4PSillIZ1ca/z8plM=;
	b=QiCZ6oxfW0Y84HAxgpY2a90tE6oPN8ApE4k+vi7Z0oHrhkxAil6UQ7RlbKlOGd9A3rZE
	 03O+jtzRrmuMaQSGeQtXOURVsYt31WrUpY4rtjXQXOCxMeK1nc+YCO2aOSbWed4kiTd+i
	 6iXrzYv0eYtYT/Rcajf/cgnhE3hgnvfR77pbaEDkEVgXMbxgw3ahHNVxTVgP2gOXPlvxM
	 V0TCfuF3UgrXJjRE+Fks7Zk12euXgZvr2oL7nI8QvfBaJqRMO7+kopnnL//KlT5Mnd4vl
	 O3HwFjDVSGJyrPRCrrz4rxDxksdsfcBuov85SxbY2HLhYbU/Odi24837RViaJy/e6fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=marvell.com;
	spf=pass smtp.mailfrom=marvell.com;
	dkim=pass header.d=marvell.com header.i=@marvell.com header.a=rsa-sha256 header.s=pfpt0220 header.b=EPNzxRsx;
	arc=none smtp.remote-ip=67.231.148.174
Received: from mx0a-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD109606A320;
	Thu, 19 Nov 2026 08:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD109606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.a=rsa-sha256 header.s=pfpt0220 header.b=EPNzxRsx
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6wZHc230397;
	Thu, 19 Nov 2026 00:54:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=64Bnh0XnQvHfVPMjYIHDspf
	blr4PSillIZ1ca/z8plM=; b=EPNzxRsxwabPTOmU1UGK+K7Es3SYI/TWqFP9eBm
	eKtA11sEuVfmzmgKXVjPh8mG//Toi2rZlCoVCMC50Pbhg4WoitK60tiEL6wZ4HuO
	5dFHMsQcHPZMSE1qIqcwcZCFaaHDXo3vy3jbxKY0R2JtdCKFUQ7hLXzmIAmND215
	K2G9D0JOOwiEGEDJy60A7vSFbmIMUhtqOxqw346u/m3it+6DszRNYgwqdg/PTtEg
	nlSjjDO9qt0HwiW+khnrPYYqbhF2SvNwRvAc6J9wcKs9Xo+XgaUyb1iYhUi0QSEo
	Uc02Lg0Dep7no66hQfk6Dioiuip1qzcWZQPy/n+88QTItJQ==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 4j1v1yrcpe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 00:54:40 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 19 Nov 2026 00:54:28 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 19 Nov 2026 00:54:27 -0800
Received: from nitinsj-apex-workbox.marvell.com (unknown [10.28.40.177])
	by maili.marvell.com (Postfix) with ESMTP id C5B7C5B6949;
	Thu, 19 Nov 2026 00:54:35 -0800 (PST)
From: <nshettyj@marvell.com>
To: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Rakesh Kudurumalla <rkudurumalla@marvell.com>,
        Nitin Shetty J
	<nshettyj@marvell.com>,
        Sunil Goutham <sgoutham@marvell.com>,
        "Ratheesh
 Kannoth" <rkannoth@marvell.com>,
        Geetha sowjanya <gakula@marvell.com>,
        Subbaraya Sundeep <sbhatta@marvell.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, "Simon
 Horman" <horms@kernel.org>
Subject: [PATCH net v4] octeontx2-af: Fix BPID leaks in NIX backpressure enable/disable
Date: Thu, 19 Nov 2026 14:24:34 +0530
Message-ID: <20261119085434.2598197-1-nshettyj@marvell.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzNSBTYWx0ZWRfXxZmSpXAqJCac
 B5pM/R2nIurTh7LS4o5KDVYOcyv91EiC9aDu04+y/2U509f+neYvLWK9zRPfmtkh6eSxEzqiRSH
 APcfd7vmmFFVVk+u6XP6JZQvNpkW0LAkNkZczgC2mGhpmhvLm0JbkHHRGpPc3zJDZYTu0iE/gzs
 NfqHPaJog/SKnf8w0t5f8tWNNR14GT4iHTcmUsj7Sza87OIP2UDe85xw7pwjGIkMAdjdL4yx5OJ
 a00OoOA1qGn3Evu0zwpP4G9LdYCUTdC9WIuNvUbBb/1wsvDf7BcZ8UxHzkrWyki471E1Km2kawj
 kAjgU7kRyvVuOUN111qNLSDZIG4dEGezlykAXeU0JvjvEGuWnWM8Zs21kSZuwjaylchSyK9C+eO
 r80nRkWZOFhujCshkannXvkXbYuq3xk3DZrjhUU6otrfDwsm2/xCcVhU6XUm0Qv9LaQCImIfgby
 9dkgL+psmLafVPviSUg==
X-Proofpoint-GUID: zblN8hw60Vao-CkXmZlkBfjwJn8Rwq5I
X-Proofpoint-ORIG-GUID: zblN8hw60Vao-CkXmZlkBfjwJn8Rwq5I
X-Authority-Analysis: v=2.4 cv=d6lgWhjE c=1 sm=1 tr=0 ts=6afeb950 cx=c_pps
 a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=l0iWHRpgs5sLHlkKQ1IR:22
 a=TtqV-g6YmW1Jfm2GSLaY:22 a=9R54UkLUAAAA:8 a=M5GUcnROAAAA:8
 a=SL9uSZ3G0BghoLyiZY8A:9 a=YTcpBFlVQWkNscrzJ_Dz:22 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzNSBTYWx0ZWRfXyn1MFmCvhubA
 TY6EQ5ztVzetkyZdZYBqj7hvfAH+S9SBj8CqhPoPPh8ALyh+0OUo/BlpdKGgQcC3ExArWMCWkj+
 UsVr5sT7JiRlw6ygLkAmsMg6633Vj8Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01

From: Rakesh Kudurumalla <rkudurumalla@marvell.com>

For LBK interfaces, rvu_nix_get_bpid() allocates a BPID from the free
pool on every call. nix_bp_enable() called it once before the channel
loop and then again after programming each channel, including the last
one, so every NIX_BP_ENABLE request leaked one BPID whose result was
never used.

Fix the leak by allocating one BPID per programmed channel. Also fix
these related problems in nix_bp_enable() and nix_bp_disable():

- In nix_bp_enable(), allocate the BPIDs up front, before touching any
  channel register. If an allocation fails, release the LBK BPIDs
  obtained so far and return, leaving the channels unmodified.
- Report the BPID actually programmed for each channel in the
  response instead of deriving it from the first channel's BPID. LBK
  BPIDs come from a shared pool and need not be contiguous.
- In nix_bp_disable(), release only the BPID read back from the
  channel, and only if it lies in the LBK free pool and is owned by
  the requesting pcifunc. Previously the BPID was freed without a
  range check, and fn_map/ref_cnt were cleared for every BPID owned
  by the function, so FLR could no longer reclaim the rest.
- Iterate over chan_cnt with a counter instead of a u16 channel
  number, which wrapped and never terminated when chan_base +
  chan_cnt went past 0xFFFF.
- Reject requests whose channels fall outside the function's RX
  channels (NIX_BPIDS_PER_LMAC for CGX, rx_chan_cnt otherwise). LBK
  had no such check.
- Keep a request with chan_cnt == 0 a successful no-op that allocates
  nothing, as SDP VFs can legitimately have 0 rings.

The per-channel release logic is factored into nix_bp_free_lbk_bpid()
and nix_bp_chan_disable().

Fixes: d6212d2e41a0 ("octeontx2-af: Create BPIDs free pool")
Signed-off-by: Rakesh Kudurumalla <rkudurumalla@marvell.com>
Signed-off-by: Nitin Shetty J <nshettyj@marvell.com>
---
Changes in v4:
- Address Sashiko AI review comments on v3:
  https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260928065718.3378580-1-nshettyj%40marvell.com
- nix_bp_enable(): allocate all BPIDs up front and program the channels
  afterwards. On failure only the LBK BPIDs obtained so far are
  released and the channels stay untouched. This replaces the v3
  nix_bp_enable_unwind(), which disabled already-programmed channels
- nix_bp_enable(): a request with chan_cnt == 0 is a successful no-op
  (rsp->chan_cnt = 0) again instead of returning
  NIX_AF_ERR_INVALID_BPID_REQ, since SDP VFs can have 0 rings
- nix_bp_enable() and nix_bp_disable(): iterate on a counter bounded by
  chan_cnt instead of a u16 channel number, which wrapped and never
  terminated when chan_base + chan_cnt went past 0xFFFF
- Reject requests whose channels go past the function's RX channels
  (NIX_BPIDS_PER_LMAC for CGX, rx_chan_cnt otherwise). LBK had no such
  check
- nix_bp_disable(): release only the BPID read from the channel, and
  only if it is in the LBK free pool and owned by the requesting
  pcifunc. v3 still cleared fn_map/ref_cnt for every BPID owned by
  the function, so FLR could not reclaim the rest
- Factor the per-channel release logic into nix_bp_free_lbk_bpid() and
  nix_bp_chan_disable()
- Use GENMASK_ULL() for the 64-bit channel config
- Reorder local variable declarations and update comments
- Expand the commit message to cover the above

Changes in v3:
- Address Sashiko AI review comments on v2:
  https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260910031604.1045397-1-nshettyj%40marvell.com
- Free allocated BPIDs on allocation failure in nix_bp_enable()
- Report the BPID written per channel instead of reconstructing it
- Validate the BPID range in nix_bp_disable() before freeing it

Changes in v2:
- Address Sashiko AI review comments on v1:
  https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260901102500.1534911-1-nshettyj%40marvell.com
- Move the rvu_nix_get_bpid() call for LBK from before the loop into
  the loop body
- Validate req->chan_cnt before allocating BPIDs
- Update commit message and Fixes tag
---
 .../ethernet/marvell/octeontx2/af/rvu_nix.c   | 128 +++++++++++++-----
 1 file changed, 91 insertions(+), 37 deletions(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c b/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
index 199723d5ec94..274662086d2a 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
+++ b/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
@@ -599,18 +599,56 @@ static u16 nix_get_channel(u16 chan, bool cpt_link)
 	return cpt_link ? chan | BIT(11) : chan;
 }
 
+static void nix_bp_free_lbk_bpid(struct rvu *rvu, struct nix_bp *bp,
+				 u16 bpid, u16 pcifunc)
+{
+	int idx;
+
+	/* Skip channels never enabled (reset value 0) or not using an LBK bpid */
+	if (bpid < bp->free_pool_base ||
+	    bpid >= bp->free_pool_base + bp->bpids.max)
+		return;
+
+	idx = bpid - bp->free_pool_base;
+
+	/* Only release the bpid if it is owned by this function. */
+	mutex_lock(&rvu->rsrc_lock);
+	if (bp->fn_map[idx] == pcifunc) {
+		rvu_free_rsrc(&bp->bpids, idx);
+		bp->fn_map[idx] = 0;
+		bp->ref_cnt[idx] = 0;
+	}
+	mutex_unlock(&rvu->rsrc_lock);
+}
+
+static void nix_bp_chan_disable(struct rvu *rvu, struct nix_bp *bp,
+				int blkaddr, u16 chan, bool cpt_link,
+				int type, u16 pcifunc)
+{
+	u16 chan_v = nix_get_channel(chan, cpt_link);
+	u64 cfg;
+
+	cfg = rvu_read64(rvu, blkaddr, NIX_AF_RX_CHANX_CFG(chan_v));
+	rvu_write64(rvu, blkaddr, NIX_AF_RX_CHANX_CFG(chan_v),
+		    cfg & ~BIT_ULL(16));
+
+	if (type != NIX_INTF_TYPE_LBK)
+		return;
+
+	nix_bp_free_lbk_bpid(rvu, bp, cfg & GENMASK_ULL(8, 0), pcifunc);
+}
+
 static int nix_bp_disable(struct rvu *rvu,
 			  struct nix_bp_cfg_req *req,
 			  struct msg_rsp *rsp, bool cpt_link)
 {
 	u16 pcifunc = req->hdr.pcifunc;
 	int blkaddr, pf, type, err;
-	u16 chan_base, chan, bpid;
 	struct rvu_pfvf *pfvf;
 	struct nix_hw *nix_hw;
 	struct nix_bp *bp;
-	u16 chan_v;
-	u64 cfg;
+	u16 chan_base;
+	int i;
 
 	pf = rvu_get_pf(rvu->pdev, pcifunc);
 	type = is_lbk_vf(rvu, pcifunc) ? NIX_INTF_TYPE_LBK : NIX_INTF_TYPE_CGX;
@@ -629,26 +667,19 @@ static int nix_bp_disable(struct rvu *rvu,
 		return err;
 
 	bp = &nix_hw->bp;
-	chan_base = pfvf->rx_chan_base + req->chan_base;
-	for (chan = chan_base; chan < (chan_base + req->chan_cnt); chan++) {
-		chan_v = nix_get_channel(chan, cpt_link);
-		cfg = rvu_read64(rvu, blkaddr, NIX_AF_RX_CHANX_CFG(chan_v));
-		rvu_write64(rvu, blkaddr, NIX_AF_RX_CHANX_CFG(chan_v),
-			    cfg & ~BIT_ULL(16));
 
-		if (type == NIX_INTF_TYPE_LBK) {
-			bpid = cfg & GENMASK(8, 0);
-			mutex_lock(&rvu->rsrc_lock);
-			rvu_free_rsrc(&bp->bpids, bpid - bp->free_pool_base);
-			for (bpid = 0; bpid < bp->bpids.max; bpid++) {
-				if (bp->fn_map[bpid] == pcifunc) {
-					bp->fn_map[bpid] = 0;
-					bp->ref_cnt[bpid] = 0;
-				}
-			}
-			mutex_unlock(&rvu->rsrc_lock);
-		}
+	/* CGX may use up to NIX_BPIDS_PER_LMAC channels (PFC) */
+	if (type == NIX_INTF_TYPE_CGX) {
+		if ((u32)req->chan_base + req->chan_cnt > NIX_BPIDS_PER_LMAC)
+			return NIX_AF_ERR_INVALID_BPID_REQ;
+	} else if ((u32)req->chan_base + req->chan_cnt > pfvf->rx_chan_cnt) {
+		return NIX_AF_ERR_INVALID_BPID_REQ;
 	}
+
+	chan_base = pfvf->rx_chan_base + req->chan_base;
+	for (i = 0; i < req->chan_cnt; i++)
+		nix_bp_chan_disable(rvu, bp, blkaddr, chan_base + i, cpt_link,
+				    type, pcifunc);
 	return 0;
 }
 
@@ -750,13 +781,17 @@ static int nix_bp_enable(struct rvu *rvu,
 			 struct nix_bp_cfg_rsp *rsp,
 			 bool cpt_link)
 {
-	int blkaddr, pf, type, chan_id = 0;
 	u16 pcifunc = req->hdr.pcifunc;
 	struct rvu_pfvf *pfvf;
+	struct nix_hw *nix_hw;
+	int blkaddr, pf, type;
 	u16 chan_base, chan;
-	s16 bpid, bpid_base;
+	struct nix_bp *bp;
 	u16 chan_v;
+	s16 bpid;
 	u64 cfg;
+	int err;
+	int i;
 
 	pf = rvu_get_pf(rvu->pdev, pcifunc);
 	type = is_lbk_vf(rvu, pcifunc) ? NIX_INTF_TYPE_LBK : NIX_INTF_TYPE_CGX;
@@ -771,35 +806,54 @@ static int nix_bp_enable(struct rvu *rvu,
 	if (cpt_link && !rvu->hw->cpt_links)
 		return 0;
 
+	if (!req->chan_cnt) {
+		rsp->chan_cnt = 0;
+		return 0;
+	}
+
 	pfvf = rvu_get_pfvf(rvu, pcifunc);
-	blkaddr = rvu_get_blkaddr(rvu, BLKTYPE_NIX, pcifunc);
+	err = nix_get_struct_ptrs(rvu, pcifunc, &nix_hw, &blkaddr);
+	if (err)
+		return err;
+
+	bp = &nix_hw->bp;
+
+	/* CGX may use up to NIX_BPIDS_PER_LMAC channels (PFC) */
+	if (type == NIX_INTF_TYPE_CGX) {
+		if ((u32)req->chan_base + req->chan_cnt > NIX_BPIDS_PER_LMAC)
+			return NIX_AF_ERR_INVALID_BPID_REQ;
+	} else if ((u32)req->chan_base + req->chan_cnt > pfvf->rx_chan_cnt) {
+		return NIX_AF_ERR_INVALID_BPID_REQ;
+	}
 
-	bpid_base = rvu_nix_get_bpid(rvu, req, type, chan_id);
 	chan_base = pfvf->rx_chan_base + req->chan_base;
-	bpid = bpid_base;
 
-	for (chan = chan_base; chan < (chan_base + req->chan_cnt); chan++) {
+	/* Get all bpids first so a failure leaves the channels untouched */
+	for (i = 0; i < req->chan_cnt; i++) {
+		bpid = rvu_nix_get_bpid(rvu, req, type, i);
 		if (bpid < 0) {
 			dev_warn(rvu->dev, "Fail to enable backpressure\n");
+			if (type == NIX_INTF_TYPE_LBK)
+				while (i--)
+					nix_bp_free_lbk_bpid(rvu, bp,
+							     rsp->chan_bpid[i] & 0x3FF,
+							     pcifunc);
 			return -EINVAL;
 		}
 
+		rsp->chan_bpid[i] = ((req->chan_base + i) & 0x7F) << 10 |
+				    (bpid & 0x3FF);
+	}
+
+	for (i = 0; i < req->chan_cnt; i++) {
+		chan = chan_base + i;
+		bpid = rsp->chan_bpid[i] & 0x3FF;
 		chan_v = nix_get_channel(chan, cpt_link);
 
 		cfg = rvu_read64(rvu, blkaddr, NIX_AF_RX_CHANX_CFG(chan_v));
 		cfg &= ~GENMASK_ULL(8, 0);
 		rvu_write64(rvu, blkaddr, NIX_AF_RX_CHANX_CFG(chan_v),
 			    cfg | (bpid & GENMASK_ULL(8, 0)) | BIT_ULL(16));
-		chan_id++;
-		bpid = rvu_nix_get_bpid(rvu, req, type, chan_id);
-	}
-
-	for (chan = 0; chan < req->chan_cnt; chan++) {
-		/* Map channel and bpid assign to it */
-		rsp->chan_bpid[chan] = ((req->chan_base + chan) & 0x7F) << 10 |
-					(bpid_base & 0x3FF);
-		if (req->bpid_per_chan)
-			bpid_base++;
 	}
 	rsp->chan_cnt = req->chan_cnt;
 
-- 
2.53.0

