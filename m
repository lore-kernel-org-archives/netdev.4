Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618161;
	b=EkG3LbP4E96ODAA4B9J/QS2BRa7RwJ4Dve/Q3kPXeWPV+X/Qvq05mY0FClPrIfHJrZNi
	 zn+GNeim4Sj7C42los/QGf509oaoBfVbkR2dhgKPbucrWgwhRLvPeSwmqNjgUe+l0Qxwt
	 3pPnaefrha1z24Q4VDp3MeT16UgxW+BpSnfY8zWnM9qIekaV1v6Ng0co0U4CQ6ufwPFU4
	 n3Kl/57/z7PvuIoukulEMipjd/uUhE4BNFyevLN6JWdvhEXaL2bMvuEegtKTfoXpoZKB1
	 SK9w+ebgkC77lsP6v4O+YJyxRICv6Red80zNbj28MxHjW6gobXEzGW0FMHsfDupAd/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618161;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AvLJ6LPJDQYfEsj0iXxgDL4EBDjauQdJXtj3K3q/NEg=;
	b=cfhZeiAbtMFlSjxAbobpUpwJwmLXdcNewOZWMgk9ggZttEikh3vOOsGuv9T0zYCByomJ
	 IanC5NGdvwU8YcQvhhunskh6/pXFYwGnQRmRD2LaLn01XsBE8GL1FmfAeDCNitdsaqRLs
	 MTUM6cG8vKXED6hf6QKBbuHwZrKZf1flWtYvu6zK3TRY47N3faQv7jl79iXZVmZsQilnX
	 74x4GyOaQSwXlTnGAzMMMJzdWMCOg7ytG8PaeLinJ3vTk3vP/5FsnooH2VkmhdMJZvzMw
	 vouj/As2Td8hMnubBJEaEQeNIF2vftKERkmPq8Ppo8lsEq8MNGru71q8+GaMOOPw+Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wfgt8Rr4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I12tslSz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBE7606A682
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FBE7606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wfgt8Rr4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I12tslSz
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APEMDEi1158492
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:49:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AvLJ6LPJDQYfEsj0iXxgDL4EBDjauQdJXtj3K3q/NEg=; b=Wfgt8Rr40icjoFz0
	93eh48mtj38nujU+LArwkZQEXDT6rvi/6D/lBPaxK8DD7Gl2CCLFHMpYDkJ1vPff
	jFPMmLvORF8/SDy2kE6onW3Htf6DTiOO+X0YCBrNecolyzzFB1klAOpjihFr7vab
	/R+hkadWZ3A+/4DlwzX7bkOJUwxOteCIPMULjcIW5bOzvghF9asen2FjJlJZ3h4V
	pcIYCl9aUO7ruZ0yt0zEC39OgeGxHP1MFd9k6mc3G7K2dtbpc7OWGcONyFQB3xCn
	DkPjGbRpfAlkavq7dAc5D1LkHXCY0ULMz8E5QIow7vxqIVvLTN8D6SQ+XA6yYzDD
	q2IMrg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnsayt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:49:19 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b0e878f574so89882807b3.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 06:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795618159; x=1796222959; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AvLJ6LPJDQYfEsj0iXxgDL4EBDjauQdJXtj3K3q/NEg=;
        b=I12tslSz4uAyFxRl3eOwK7sjzirib021B7Znn9ZXmSVpYE0XLhNAaB2UYH+mPjr5Sa
         fX/gKwGampzYkCVvDjH4cfPmcbpKW0kl2+rfJ5tzfWXoRgFvWus0sMFtNfKkGWP+63wK
         kFyqJqFoQYptOmky9j6G4t5Zwx3KDgGLqrN6A6Mn6G/7Z5TTF9ebstjUEZw4rldOxNtl
         lJL4qIPCkKp2FqN6jCJLukUvrteH4CLH7T/Rlm5Fg0kYUHZUtPKOZ6EpppLzpExDKLu2
         Y6NxOzRPwdVNJvRjnvKQ11C2w7p/7SNdylS3KFhmVl3ovzisz47xkJUUm7qNHMy7u4+c
         E+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618159; x=1796222959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AvLJ6LPJDQYfEsj0iXxgDL4EBDjauQdJXtj3K3q/NEg=;
        b=mW/Am0B7nGnDfc+GebK52IzKLzDfhTc3YTYB5U7EKbAUr1VL1hGUMDtYA0GFngs10P
         F9g69ToTJlKcE8eD1FHPcK8v1X4YJEFDKuPNE1T8XrGsNgwSX6qQeszZu34dCT0dpb9x
         4WIExU/uGW0y9Sw+KQgb59WPdIotQrjG+xYvM0/QBdFHIgefz81kBbMHnLNdc7AmGf8d
         CYDYVL1fq5wu9mqIRoSLypZlaZuTceE3Jzmlwi/H4VSpZ9lB7cJJmGANRHCkhIWi6Flh
         M8ZSixDTA7K4K7P50suBaNkZ5lv/bnaQ1DIX1gJ0en0mxZm0ikRBDJhDM1qetH1rZWQ0
         IseQ==
X-Gm-Message-State: APuU4Z89RZpPGj9+nyBAWJg/izvfKa5Yk8UPG7fBWt48C+a+DvhPECJr
	3P91HknCg+vl5bHbt3+BAjLV07I5bt8maskv95Pov5gG8o4kWH1ldle+XfxHCXWNve32tIF3Rmf
	zGFG0fh47KyjnkNBDb3GUmdhJuEJyTit3BG5aXG0hZUv2f+pcV8C19zGdZzY=
X-Gm-Gg: AZFdTZd4PqcrUrGYgGMPoWpQ4jP9JC6F0p9BpbfLeJoW/gJ767aJ1tf0X5uXHkz2yv6
	41GbmBVjIa3Qumx4Yl7O9SVYZQIKUSDyW8WgyWGd1eIhtQ5u756/q5Gml80n+21ifdX9vNNk5Cx
	Lvd9YVXPwXLIT9scgcZ8mdeYJa/gyNi/WxqQu+0fkvPbUXNdAVs9WuJkBvMq8I54pnVYISKQQQB
	VluWir9kS3KNWHInk5jUwe0CnaTPlI1Xd8epnECI+ddWynA4kAQY/TqAg3q+ZEVHgj1Yoxyujpw
	unbLoe2kFvwkdbsH7CXQrlH78OlQ6QafkM17T346cttJjZlXvjpceMlI7j8xF5KQChkVu2I1PtV
	Bs1jo+5AczmMu7Vuvg4CGgpujT9PXjldc8s0TvmWb81lLj7iCD13BpZxEXj4YHrc=
X-Received: by 2002:a05:690c:e09:b0:8b0:bc8e:9d75 with SMTP id 00721157ae682-8b5204b991bmr72173967b3.22.1795618158749;
        Wed, 25 Nov 2026 06:49:18 -0800 (PST)
X-Received: by 2002:a05:690c:e09:b0:8b0:bc8e:9d75 with SMTP id 00721157ae682-8b5204b991bmr72173287b3.22.1795618157864;
        Wed, 25 Nov 2026 06:49:17 -0800 (PST)
Received: from localhost ([188.152.73.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b8e564e39asm5195385f8f.57.2026.11.25.06.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:49:16 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 15:48:48 +0100
Subject: [PATCH net-next v13 3/5] net: xdp: add xdp_buff_shrink_tail()
 helper
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-stmmac-rx-mb-v13-3-0f6bac53e8d5@oss.qualcomm.com>
References: <20261125-stmmac-rx-mb-v13-0-0f6bac53e8d5@oss.qualcomm.com>
In-Reply-To: <20261125-stmmac-rx-mb-v13-0-0f6bac53e8d5@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Ong Boon Leong <boon.leong.ong@intel.com>,
        Simon Horman <horms@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
        Eduard Zingerman <eddyz87@gmail.com>,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>,
        Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
        Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
        Emil Tsalapatis <emil@etsalapatis.com>,
        Ihor Solodrai <ihor.solodrai@linux.dev>,
        Matthew Gerlach <matthew.gerlach@altera.com>,
        Boon Khai Ng <boon.khai.ng@altera.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bpf@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1OCBTYWx0ZWRfX4l0TTOFx4qX2
 nGtfTSyJehVsRCtoW56z88Jj3PhYa7b2xv1Fr8QtxddpVyRKHLDZTNhLEY38y1uIK8b4R9IHdYW
 s1awie+U38784Mrn+0myuTx+yUIRC4p7hhGRxU0XEsfuDuxtqu85kaOrrKdfERnLIp7TFZBCOqd
 /xnNd3En+o4rTFj86/2l+7FddwrA2aTs5ySv4g8qD7yi4B6IOOJFxjXJ0s2LIfdScD7qQ4ntgkL
 eZF5SvhDaGmGcmtjqlv9Dpy6vjMkY6ncl5aA7byYmbybGlbVSIPwYdABd5trJ7nl2sI/G1heCCx
 eMCmzIEBRzCtwRdmFbP+bCL2Dz62HwpCSEVZPULKnkcDbPIJqVCdsReYpXB2jIsEXwLwZtahb/A
 ItbAhJfZABqL+FrlaLl2rnNhZHY9KCklyeYVh2xLjupoDC4zfM9buipTAbtRhO63H90F8jzJbL8
 8sjjr5wUmtosokjpZAA==
X-Proofpoint-ORIG-GUID: k61ojtt4I1kjclZpNc9e12-8Nd-mmb8y
X-Proofpoint-GUID: k61ojtt4I1kjclZpNc9e12-8Nd-mmb8y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1OCBTYWx0ZWRfX/TmSIz4dIR2k
 WYBmCpGtd6Zm6VfSmer3dfkY50Vsm9JQT1/UuPX+P5pfSXVMLiBZRsFZxfisNJ1UT0jynDb+d2b
 mDagp9xpUVnl1/CEV/9/wiHPIQ+VQ20=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b06f56f cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=NV2rGKbi5YIghCh-FX4A:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250058

Move the XDP tail-shrink logic out of bpf_xdp_adjust_tail() into
net/core/xdp.c so it can be shared with drivers. The frag helpers
(bpf_xdp_shrink_data_zc(), bpf_xdp_shrink_data() and
bpf_xdp_frags_shrink_tail()) move along with it and are renamed to
xdp_buff_shrink_data_zc(), xdp_buff_shrink_data() and
xdp_frags_shrink_tail().

Add xdp_buff_shrink_tail(), which handles the linear case too and is
exported with EXPORT_SYMBOL_GPL() for driver use. Unlike
bpf_xdp_adjust_tail(), it takes the number of bytes to remove as a
positive value; bpf_xdp_adjust_tail() keeps its signed offset ABI and
passes -offset for the shrink case. Negative offsets are rejected.

bpf_xdp_pull_data() keeps using the frag helper under its new name.
Behavior for valid offsets is unchanged.

This lets stmmac use the common helper to strip the Ethernet FCS from
the xdp_buff it accumulates for a multi-descriptor frame.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 include/net/xdp.h |  3 ++
 net/core/filter.c | 80 +++----------------------------------------------
 net/core/xdp.c    | 89 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 96 insertions(+), 76 deletions(-)

diff --git a/include/net/xdp.h b/include/net/xdp.h
index 07231adfb5f8..02289028044c 100644
--- a/include/net/xdp.h
+++ b/include/net/xdp.h
@@ -388,6 +388,9 @@ struct sk_buff *__xdp_build_skb_from_frame(struct xdp_frame *xdpf,
 struct sk_buff *xdp_build_skb_from_frame(struct xdp_frame *xdpf,
 					 struct net_device *dev);
 struct xdp_frame *xdpf_clone(struct xdp_frame *xdpf);
+int xdp_buff_shrink_tail(struct xdp_buff *xdp, int offset);
+bool xdp_buff_shrink_data(struct xdp_buff *xdp, skb_frag_t *frag,
+			  int shrink, bool tail);
 
 static inline
 void xdp_convert_frame_to_buff(const struct xdp_frame *frame,
diff --git a/net/core/filter.c b/net/core/filter.c
index f42ecfb5841f..cdbb54a10b0b 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -4438,88 +4438,16 @@ static int bpf_xdp_frags_increase_tail(struct xdp_buff *xdp, int offset)
 	return 0;
 }
 
-static struct xdp_buff *bpf_xdp_shrink_data_zc(struct xdp_buff *xdp, int shrink,
-					       bool tail, bool release)
-{
-	struct xdp_buff *zc_frag = tail ? xsk_buff_get_tail(xdp) :
-					  xsk_buff_get_head(xdp);
-
-	if (release) {
-		xsk_buff_del_frag(zc_frag);
-	} else {
-		if (tail)
-			zc_frag->data_end -= shrink;
-		else
-			zc_frag->data += shrink;
-	}
-
-	return zc_frag;
-}
-
-static bool bpf_xdp_shrink_data(struct xdp_buff *xdp, skb_frag_t *frag,
-				int shrink, bool tail)
-{
-	enum xdp_mem_type mem_type = xdp->rxq->mem.type;
-	bool release = skb_frag_size(frag) == shrink;
-	netmem_ref netmem = skb_frag_netmem(frag);
-	struct xdp_buff *zc_frag = NULL;
-
-	if (mem_type == MEM_TYPE_XSK_BUFF_POOL) {
-		netmem = 0;
-		zc_frag = bpf_xdp_shrink_data_zc(xdp, shrink, tail, release);
-	}
-
-	if (release) {
-		__xdp_return(netmem, mem_type, false, zc_frag);
-	} else {
-		if (!tail)
-			skb_frag_off_add(frag, shrink);
-		skb_frag_size_sub(frag, shrink);
-	}
-
-	return release;
-}
-
-static int bpf_xdp_frags_shrink_tail(struct xdp_buff *xdp, int offset)
-{
-	struct skb_shared_info *sinfo = xdp_get_shared_info_from_buff(xdp);
-	int i, n_frags_free = 0, len_free = 0;
-
-	if (unlikely(offset > (int)xdp_get_buff_len(xdp) - ETH_HLEN))
-		return -EINVAL;
-
-	for (i = sinfo->nr_frags - 1; i >= 0 && offset > 0; i--) {
-		skb_frag_t *frag = &sinfo->frags[i];
-		int shrink = min_t(int, offset, skb_frag_size(frag));
-
-		len_free += shrink;
-		offset -= shrink;
-		if (bpf_xdp_shrink_data(xdp, frag, shrink, true))
-			n_frags_free++;
-	}
-	sinfo->nr_frags -= n_frags_free;
-	sinfo->xdp_frags_size -= len_free;
-
-	if (unlikely(!sinfo->nr_frags)) {
-		xdp_buff_clear_frags_flag(xdp);
-		xdp_buff_clear_frag_pfmemalloc(xdp);
-		xdp->data_end -= offset;
-	}
-
-	return 0;
-}
-
 BPF_CALL_2(bpf_xdp_adjust_tail, struct xdp_buff *, xdp, int, offset)
 {
 	void *data_hard_end = xdp_data_hard_end(xdp); /* use xdp->frame_sz */
 	void *data_end = xdp->data_end + offset;
 
-	if (unlikely(xdp_buff_has_frags(xdp))) { /* non-linear xdp buff */
-		if (offset < 0)
-			return bpf_xdp_frags_shrink_tail(xdp, -offset);
+	if (offset < 0)
+		return xdp_buff_shrink_tail(xdp, -offset);
 
+	if (unlikely(xdp_buff_has_frags(xdp))) /* non-linear xdp buff */
 		return bpf_xdp_frags_increase_tail(xdp, offset);
-	}
 
 	/* Notice that xdp_data_hard_end have reserved some tailroom */
 	if (unlikely(data_end > data_hard_end))
@@ -12840,7 +12768,7 @@ __bpf_kfunc int bpf_xdp_pull_data(struct xdp_md *x, u32 len)
 		xdp->data_end += shrink;
 		sinfo->xdp_frags_size -= shrink;
 		delta -= shrink;
-		if (bpf_xdp_shrink_data(xdp, frag, shrink, false))
+		if (xdp_buff_shrink_data(xdp, frag, shrink, false))
 			n_frags_free++;
 	}
 
diff --git a/net/core/xdp.c b/net/core/xdp.c
index 1d679e8fd649..055931263413 100644
--- a/net/core/xdp.c
+++ b/net/core/xdp.c
@@ -673,6 +673,95 @@ struct sk_buff *xdp_build_skb_from_buff(const struct xdp_buff *xdp)
 }
 EXPORT_SYMBOL_GPL(xdp_build_skb_from_buff);
 
+static struct xdp_buff *xdp_buff_shrink_data_zc(struct xdp_buff *xdp,
+						int shrink, bool tail,
+						bool release)
+{
+	struct xdp_buff *zc_frag = tail ? xsk_buff_get_tail(xdp) :
+					  xsk_buff_get_head(xdp);
+
+	if (release) {
+		xsk_buff_del_frag(zc_frag);
+	} else {
+		if (tail)
+			zc_frag->data_end -= shrink;
+		else
+			zc_frag->data += shrink;
+	}
+
+	return zc_frag;
+}
+
+bool xdp_buff_shrink_data(struct xdp_buff *xdp, skb_frag_t *frag,
+			  int shrink, bool tail)
+{
+	enum xdp_mem_type mem_type = xdp->rxq->mem.type;
+	bool release = skb_frag_size(frag) == shrink;
+	netmem_ref netmem = skb_frag_netmem(frag);
+	struct xdp_buff *zc_frag = NULL;
+
+	if (mem_type == MEM_TYPE_XSK_BUFF_POOL) {
+		netmem = 0;
+		zc_frag = xdp_buff_shrink_data_zc(xdp, shrink, tail, release);
+	}
+
+	if (release) {
+		__xdp_return(netmem, mem_type, false, zc_frag);
+	} else {
+		if (!tail)
+			skb_frag_off_add(frag, shrink);
+		skb_frag_size_sub(frag, shrink);
+	}
+
+	return release;
+}
+
+static int xdp_frags_shrink_tail(struct xdp_buff *xdp, int offset)
+{
+	struct skb_shared_info *sinfo = xdp_get_shared_info_from_buff(xdp);
+	int i, n_frags_free = 0, len_free = 0;
+
+	if (unlikely(offset > (int)xdp_get_buff_len(xdp) - ETH_HLEN))
+		return -EINVAL;
+
+	for (i = sinfo->nr_frags - 1; i >= 0 && offset > 0; i--) {
+		skb_frag_t *frag = &sinfo->frags[i];
+		int shrink = min_t(int, offset, skb_frag_size(frag));
+
+		len_free += shrink;
+		offset -= shrink;
+		if (xdp_buff_shrink_data(xdp, frag, shrink, true))
+			n_frags_free++;
+	}
+	sinfo->nr_frags -= n_frags_free;
+	sinfo->xdp_frags_size -= len_free;
+
+	if (unlikely(!sinfo->nr_frags)) {
+		xdp_buff_clear_frags_flag(xdp);
+		xdp_buff_clear_frag_pfmemalloc(xdp);
+		xdp->data_end -= offset;
+	}
+
+	return 0;
+}
+
+int xdp_buff_shrink_tail(struct xdp_buff *xdp, int offset)
+{
+	if (unlikely(offset < 0))
+		return -EINVAL;
+
+	if (unlikely(xdp_buff_has_frags(xdp))) /* non-linear xdp buff */
+		return xdp_frags_shrink_tail(xdp, offset);
+
+	if (unlikely(offset > xdp->data_end - xdp->data - ETH_HLEN))
+		return -EINVAL;
+
+	xdp->data_end = xdp->data_end - offset;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(xdp_buff_shrink_tail);
+
 /**
  * xdp_copy_frags_from_zc - copy frags from XSk buff to skb
  * @skb: skb to copy frags to

-- 
2.56.1

