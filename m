Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107243;
	b=vyNm33HmvQtshfr3oEaHPkCyenDrXjaaemfjsRAeS6/IcxipJxBuWLodlQVKtWo4YapZ
	 Yf3E7WmZ42Zq5HYnjZ/tFglLGG2zfzRPktrdACs45PJ5FwjbPqoU2IbwYyiI10ZXEvH40
	 7Cx9hZJ6A61QMlS/q67a/5ZEbIhS7EORCaU0V2m7o/2E3CsbpYIBu0dMNr0cs3gGX/R/+
	 4aId63H/kcgR4WlMmdevowaLPRyDOy97Z/jtpH3Mu+ckx+1T/3MEFckg7BnZPzEqajwXZ
	 lTf/z0T8h/YKC/kIbEdC9f0FHxEU83xYUziJwy4dCzqqeBJbhlEKx6IqvXR9hzLvVig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107243;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UiueGydypUCFcibsno5g6MZ/gLLuDorxgcw0hPfbZ+o=;
	b=OR0SvaNWTjY1+2iZ6syTKdO80aBXVdL9yA9npUTMUuI56LcFSwqN3ddZxHXqbV+nXR/4
	 uoZoLiyG+07tJbwYy/2OYFiSz3ss804+PBNwSNCuO8y5BuDcfyIaiPv7GYpT4nw9eHnFS
	 f30JoKfmnTo5gUPFXvFNmXS5f6K9Pk1U83IX/v8vxosN9c5+5tfewphh8wz8OqUXFpNzy
	 EPJTSU66VTFKxhRTbY/GXSgMY5d2QFf0VTEjm9Q3qFz0qefgCl9xTe2zUCzOZR3BpI1I9
	 Sjo51OPdf7InfM5rexcyGLdoKAeluII18BwbcOELrCRKNl6T/+OM0aHS6xtX5qcVW4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dd8HhFjm;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59434606A32F
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59434606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dd8HhFjm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795107244; x=1826643244;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xc/QIalpfKwrzppc5y9if1OnQN742H/iHd7mNLlTKSc=;
  b=Dd8HhFjmpe1CiGhdqBakNwJlBFgQmdaZvWL5NhAxTDvgQcRP8TtamyrP
   eoYOJfWn3/AhUNRukRARtznQll4JiE8Z9VJOl8x0YvTRJ8TE+O90Hln/T
   URzx2D/6X9iXnwoNJ3/P3H5CiWw+UlNHdQfxC63bm/Kbs27LDoI3fXQMC
   C+7sqRy2r3e/uBiu8bppzlDyT2yhmxrBlJbUjxGr3j4WHC4z26i00g6hU
   9T2ktjHxGNRiNt4KmHXAePZHOIZOHfbgwGDidAkO+/RCTTSTgaQWazZzP
   iGXes8uixVXhOUiSj/4ZF4QtZC9EspVT0W1UXWyhexqbDvS/dv5cKxPqu
   g==;
X-CSE-ConnectionGUID: 8XPOjcVDSX+I4N9Pku9MJA==
X-CSE-MsgGUID: 7dNeZYcWQfCAJzDOIYXjeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4045433"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4045433"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 08:54:03 -0800
X-CSE-ConnectionGUID: 5b/a1OUCQ/Wbr1hrhn+OoQ==
X-CSE-MsgGUID: WVvB42y1QB6moYw245xwRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10774945"
Received: from boxer.igk.intel.com ([10.102.20.173])
  by orviesa009.jf.intel.com with ESMTP; 19 Nov 2026 08:54:00 -0800
From: Magnus Karlsson <magnus.karlsson@intel.com>
To: netdev@vger.kernel.org,
	magnus.karlsson@intel.com,
	magnus.karlsson@gmail.com,
	maciej.fijalkowski@intel.com,
	sdf@fomichev.me,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	bjorn@kernel.org,
	kerneljasonxing@gmail.com
Cc: intel-wired-lan@lists.osuosl.org,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	jacob.e.keller@intel.com
Subject: [PATCH net-next 2/5] ice: add Tx descriptor builders and header length check
Date: Thu, 19 Nov 2026 17:53:37 +0100
Message-Id: <20261119165340.1071525-3-magnus.karlsson@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20261119165340.1071525-1-magnus.karlsson@intel.com>
References: <20261119165340.1071525-1-magnus.karlsson@intel.com>
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

Add ice_build_tx_desc_offset() and ice_build_tso_ctx_qw1() to
ice_txrx_lib.h for the length fields of the Tx data descriptor and the
TSO context descriptor, and use them in ice_tso() and ice_tx_csum().
Add ice_tx_hdr_lens_ok() for the header length limits of the data
descriptor, and use it in ice_features_check().

This prepares for AF_XDP USO in zero-copy mode, which builds the same
descriptors from a copied packet header instead of an skb. The new
check also requires IPLEN to be a multiple of 4 bytes, as the field is
encoded in dwords, and so does the inner IPLEN check for encapsulated
packets. The IPv4 and IPv6 header lengths that reach them always are.
No functional change intended.

Signed-off-by: Magnus Karlsson <magnus.karlsson@intel.com>
---
 drivers/net/ethernet/intel/ice/ice_main.c     | 12 ++---
 drivers/net/ethernet/intel/ice/ice_txrx.c     | 20 +++-----
 drivers/net/ethernet/intel/ice/ice_txrx_lib.h | 48 +++++++++++++++++++
 3 files changed, 60 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
index 47c6798c97e8..41bcac642291 100644
--- a/drivers/net/ethernet/intel/ice/ice_main.c
+++ b/drivers/net/ethernet/intel/ice/ice_main.c
@@ -10,6 +10,7 @@
 #include "ice.h"
 #include "ice_base.h"
 #include "ice_lib.h"
+#include "ice_txrx_lib.h"
 #include "ice_fltr.h"
 #include "ice_dcb_lib.h"
 #include "ice_dcb_nl.h"
@@ -9748,12 +9749,8 @@ ice_features_check(struct sk_buff *skb,
 	if (gso && (skb_shinfo(skb)->gso_size < ICE_TXD_CTX_MIN_MSS))
 		features &= ~NETIF_F_GSO_MASK;
 
-	len = skb_network_offset(skb);
-	if (len > ICE_TXD_MACLEN_MAX || len & 0x1)
-		goto out_rm_features;
-
-	len = skb_network_header_len(skb);
-	if (len > ICE_TXD_IPLEN_MAX || len & 0x1)
+	if (!ice_tx_hdr_lens_ok(skb_network_offset(skb),
+				skb_network_header_len(skb)))
 		goto out_rm_features;
 
 	if (skb->encapsulation) {
@@ -9770,8 +9767,9 @@ ice_features_check(struct sk_buff *skb,
 				goto out_rm_features;
 		}
 
+		/* IPLEN is encoded in dwords, see ice_tx_hdr_lens_ok() */
 		len = skb_inner_network_header_len(skb);
-		if (len > ICE_TXD_IPLEN_MAX || len & 0x1)
+		if (len > ICE_TXD_IPLEN_MAX || len & 3)
 			goto out_rm_features;
 	}
 
diff --git a/drivers/net/ethernet/intel/ice/ice_txrx.c b/drivers/net/ethernet/intel/ice/ice_txrx.c
index 35a480a1e172..7877c27293a6 100644
--- a/drivers/net/ethernet/intel/ice/ice_txrx.c
+++ b/drivers/net/ethernet/intel/ice/ice_txrx.c
@@ -1624,7 +1624,6 @@ int ice_tx_csum(struct ice_tx_buf *first, struct ice_tx_offload_params *off)
 
 	/* compute outer L2 header size */
 	l2_len = ip.hdr - skb->data;
-	offset = (l2_len / 2) << ICE_TX_DESC_LEN_MACLEN_S;
 
 	/* set the tx_flags to indicate the IP protocol type. this is
 	 * required so that checksum header computation below is accurate.
@@ -1736,7 +1735,6 @@ int ice_tx_csum(struct ice_tx_buf *first, struct ice_tx_offload_params *off)
 
 	/* compute inner L3 header size */
 	l3_len = l4.hdr - ip.hdr;
-	offset |= (l3_len / 4) << ICE_TX_DESC_LEN_IPLEN_S;
 
 	if ((tx_ring->netdev->features & NETIF_F_HW_CSUM) &&
 	    !(first->tx_flags & ICE_TX_FLAGS_TSO) &&
@@ -1757,7 +1755,7 @@ int ice_tx_csum(struct ice_tx_buf *first, struct ice_tx_offload_params *off)
 		off->cd_qw1 |= ICE_TX_DESC_DTYPE_CTX;
 		off->cd_gcs_params = gcs_params;
 		/* Fill out CSO info in data descriptors */
-		off->td_offset |= offset;
+		off->td_offset |= ice_build_tx_desc_offset(l2_len, l3_len, 0);
 		off->td_cmd |= cmd;
 		return 1;
 	}
@@ -1767,26 +1765,24 @@ int ice_tx_csum(struct ice_tx_buf *first, struct ice_tx_offload_params *off)
 	case IPPROTO_TCP:
 		/* enable checksum offloads */
 		cmd |= ICE_TX_DESC_CMD_L4T_EOFT_TCP;
-		l4_len = l4.tcp->doff;
-		offset |= l4_len << ICE_TX_DESC_LEN_L4_LEN_S;
+		l4_len = l4.tcp->doff * sizeof(u32);
 		break;
 	case IPPROTO_UDP:
 		/* enable UDP checksum offload */
 		cmd |= ICE_TX_DESC_CMD_L4T_EOFT_UDP;
-		l4_len = (sizeof(struct udphdr) >> 2);
-		offset |= l4_len << ICE_TX_DESC_LEN_L4_LEN_S;
+		l4_len = sizeof(struct udphdr);
 		break;
 	case IPPROTO_SCTP:
 		/* enable SCTP checksum offload */
 		cmd |= ICE_TX_DESC_CMD_L4T_EOFT_SCTP;
-		l4_len = sizeof(struct sctphdr) >> 2;
-		offset |= l4_len << ICE_TX_DESC_LEN_L4_LEN_S;
+		l4_len = sizeof(struct sctphdr);
 		break;
 
 	default:
 		goto checksum_sw_fb;
 	}
 
+	offset = ice_build_tx_desc_offset(l2_len, l3_len, l4_len);
 	off->td_cmd |= cmd;
 	off->td_offset |= offset;
 	return 1;
@@ -1940,10 +1936,8 @@ int ice_tso(struct ice_tx_buf *first, struct ice_tx_offload_params *off)
 	cd_mss = skb_shinfo(skb)->gso_size;
 
 	/* record cdesc_qw1 with TSO parameters */
-	off->cd_qw1 |= (u64)(ICE_TX_DESC_DTYPE_CTX |
-			     (ICE_TX_CTX_DESC_TSO << ICE_TXD_CTX_QW1_CMD_S) |
-			     (cd_tso_len << ICE_TXD_CTX_QW1_TSO_LEN_S) |
-			     (cd_mss << ICE_TXD_CTX_QW1_MSS_S));
+	off->cd_qw1 |= ICE_TX_DESC_DTYPE_CTX |
+		       ice_build_tso_ctx_qw1(cd_tso_len, cd_mss);
 	first->tx_flags |= ICE_TX_FLAGS_TSO;
 	return 1;
 }
diff --git a/drivers/net/ethernet/intel/ice/ice_txrx_lib.h b/drivers/net/ethernet/intel/ice/ice_txrx_lib.h
index f17990b68b62..e9dc17dab2a4 100644
--- a/drivers/net/ethernet/intel/ice/ice_txrx_lib.h
+++ b/drivers/net/ethernet/intel/ice/ice_txrx_lib.h
@@ -53,6 +53,54 @@ ice_build_ctob(u64 td_cmd, u64 td_offset, unsigned int size, u64 td_tag)
 			   (td_tag    << ICE_TXD_QW1_L2TAG1_S));
 }
 
+/**
+ * ice_tx_hdr_lens_ok - check header lengths against the Tx descriptor fields
+ * @mac_len: L2 header length in bytes
+ * @ip_len: L3 header length in bytes
+ *
+ * MACLEN is encoded in 2-byte words and IPLEN in 4-byte dwords, in fields of
+ * limited width.
+ *
+ * Return: true if the MACLEN and IPLEN fields of a Tx data descriptor can
+ * hold these lengths.
+ */
+static inline bool ice_tx_hdr_lens_ok(u32 mac_len, u32 ip_len)
+{
+	return mac_len <= ICE_TXD_MACLEN_MAX && !(mac_len & 1) &&
+	       ip_len <= ICE_TXD_IPLEN_MAX && !(ip_len & 3);
+}
+
+/**
+ * ice_build_tx_desc_offset - build the offset field of a Tx data descriptor
+ * @mac_len: L2 header length in bytes
+ * @ip_len: L3 header length in bytes
+ * @l4_len: L4 header length in bytes
+ *
+ * Return: the MACLEN field in 2-byte words, and the IPLEN and L4LEN fields in
+ * 4-byte dwords.
+ */
+static inline u32 ice_build_tx_desc_offset(u32 mac_len, u32 ip_len, u32 l4_len)
+{
+	return (mac_len / 2) << ICE_TX_DESC_LEN_MACLEN_S |
+	       (ip_len / 4) << ICE_TX_DESC_LEN_IPLEN_S |
+	       (l4_len / 4) << ICE_TX_DESC_LEN_L4_LEN_S;
+}
+
+/**
+ * ice_build_tso_ctx_qw1 - build quad word 1 of a TSO context descriptor
+ * @tso_len: payload bytes to segment, excluding the headers
+ * @mss: payload bytes per output segment
+ *
+ * Return: the TSO command with the TSO_LEN and MSS fields. The caller adds the
+ * descriptor type.
+ */
+static inline u64 ice_build_tso_ctx_qw1(u32 tso_len, u16 mss)
+{
+	return (u64)ICE_TX_CTX_DESC_TSO << ICE_TXD_CTX_QW1_CMD_S |
+	       (u64)tso_len << ICE_TXD_CTX_QW1_TSO_LEN_S |
+	       (u64)mss << ICE_TXD_CTX_QW1_MSS_S;
+}
+
 /**
  * ice_build_tstamp_desc - build Tx time stamp descriptor
  * @tx_desc: Tx LAN descriptor index
-- 
2.38.1

