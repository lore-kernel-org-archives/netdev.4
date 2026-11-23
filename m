Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467366;
	b=jEcBsLqlR3yzTkHZ9ccwKb9wlfTLyGKrSFcotvjVch1AOzbGdB7R/U4jLs1FiuVg+aT0
	 y0r/PjlSPCa19ueCet2ij4Y4bIJ23b1sfx5Ei4VREAEvyY/9WqgpGq0/TP0cQNoj8qyv1
	 hL9ASOrbR3FuAXsdwpHP8nQMj2R1EBAW6kR3W+y73fXt4+SbE+HRrDCFNCM4dA1ktQRTa
	 GPEg2eIpWxrZCea2tED6nRmLd/Zks7rKaP4ojWiOfuqxazlv5YAO2gthsz3tSJL2gH01B
	 ojy0/+TDwcMgtshpSMmZSZeU+QWYLejQa+gh7l0+l1KqDxtTLxnl6vLLdCJtrPuzf3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467366;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=v9Xs/9UOCy4NfFRwfw2OqgdiPlsC+LHKW1TGrRmz/LM=;
	b=L5CZbtBHs84+wSsN6YbN2v7hqZcLUzbDEHUXF/q4p93KWIgsjXNTwDW2pgLFD8LtMjaq
	 kYP4HhSoBD4S2PQFsbFdMCwytYSXWk3FwVjWcvXaDNGaXAWFxvw0x39p5blSc3lJOnH0T
	 NFEF+XwbDa9vdR6dNIg24piogYsFHAWYr008attCypClQqg7pnW9bDxd6zSUtHSNreZlP
	 OxOs48z0OmFUp7IPPjFWzoAyqr8DztThm/x32jQC+POOnvPqwb+o1i0XYWI9/6FGUymwv
	 wL0wFIRTLWSEXGPPG4drGNhuMkXeoCpJNDdU2rpvt5RdHIsS4SYTEucnC+FQvdmiolg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="J/dN1gxv";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2627606A33D
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 20:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J/dN1gxv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30FFD1F000F2;
	Mon, 23 Nov 2026 20:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795467365;
	bh=v9Xs/9UOCy4NfFRwfw2OqgdiPlsC+LHKW1TGrRmz/LM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=J/dN1gxvnYKauldEd9oK53I5GRAkqD2Gs/66fv1eLZdajpk4FFszV+WhEOqyKTq1E
	 ltZn6EbmVnwsjwB7909nIxNW/4qglyhhEFLRe0xVUTyCacyuSwipXlyLcwSk7EO60d
	 2GRMPTPvgucDJP6XH6ZGDJp76yY6WLSIW2yXpQAWtOYo6DWAK3nco765LBzmXbLcDH
	 U9+5ZxWikEwWXi8TZq/UHY2ny63wkgdEt2sHxRN3XLWl3cAn9jZ14LVk6TSX7+1/tL
	 MMtZmv7XfgRrnbCvfK5B9KO3Dt9GYqqlVynShRtjVqYDzpHNzkbngne8jiQbDVwKKS
	 9DMofhxtvtDjQ==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	ahmed.zaki@intel.com,
	jacob.e.keller@intel.com,
	intel-wired-lan@lists.osuosl.org,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net 2/2] iavf: don't unintentionally switch to symmetric RSS hash
Date: Mon, 23 Nov 2026 12:56:00 -0800
Message-ID: <20261123205600.1794292-3-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123205600.1794292-1-kuba@kernel.org>
References: <20261123205600.1794292-1-kuba@kernel.org>
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

RXH_XFRM_NO_CHANGE is 0xff, iavf looks at this field to check if
RXH_XFRM_SYM_XOR bit is set, without first checking for the
special NO_CHANGE value.

This causes any ethtool -X invocation without explicitly
specifying input_xfrm to try to enable symmetric-hashing.
On VFs without input_xfrm support, NO_CHANGE would have
returned -EOPNOTSUPP.

NIPA HW tests would catch this but there's no runner testing iavf.
iavf was pointed out by an LLM, fix was compile-tested only.

Fixes: 0dd415d15505 ("net: ethtool: add a NO_CHANGE uAPI for new RXFH's input_xfrm")
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 drivers/net/ethernet/intel/iavf/iavf_ethtool.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/iavf/iavf_ethtool.c b/drivers/net/ethernet/intel/iavf/iavf_ethtool.c
index e7cf12eaa268..d81b2d6a68ac 100644
--- a/drivers/net/ethernet/intel/iavf/iavf_ethtool.c
+++ b/drivers/net/ethernet/intel/iavf/iavf_ethtool.c
@@ -1824,7 +1824,8 @@ static int iavf_set_rxfh(struct net_device *netdev,
 	    rxfh->hfunc != ETH_RSS_HASH_TOP)
 		return -EOPNOTSUPP;
 
-	if ((rxfh->input_xfrm & RXH_XFRM_SYM_XOR) &&
+	if (rxfh->input_xfrm != RXH_XFRM_NO_CHANGE &&
+	    (rxfh->input_xfrm & RXH_XFRM_SYM_XOR) &&
 	    adapter->hfunc != VIRTCHNL_RSS_ALG_TOEPLITZ_SYMMETRIC) {
 		if (!ADV_RSS_SUPPORT(adapter))
 			return -EOPNOTSUPP;
-- 
2.56.1

