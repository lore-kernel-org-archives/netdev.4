Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795282119;
	b=wBUoYMrwT0mmVUnaSv39/gN3Q/gPC7R8BIVuFSDuZjFLHnDtQQCXxdTI0e7tPOUgkgyD
	 jMf1C/1t3ucCRpzwezaLb6qToxlppK9K/VEuN5wD5ZPBnQYTTXroFGmliECs5079tl+5C
	 vBI3x96MetL7K2YxUcQ7N/mVJSL5M22DAp/d/FJddunpfpKiR5G29mg0OOIJV1SbA9V6R
	 D4WV6pNoeQGVixzhdzfaT6GFSjNF0VQOrvcZwihm5ynyrUNbtPyJqV3wP06zrn9MUa+Fr
	 bhHUDhQwenwWDL0KLyx1UhRR3JfOaXqGnMqVc1GHK/zN9HWI4WgkC00Hc+HuZW54Fjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795282119;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VSSSORsiisY1CsQn0K2p7M1sRt5FkQmSwTkw4vbiEU4=;
	b=buHW17YFlziQPGk3OfmUTHqJnI+77w6NCyfWaqLgqouyGfxU7o+LvmDmwfSyHFKs/vVM
	 9TLtbTZMBDIVmls+AIDt/KUXA7STDbsXCDY44ye+QgQcw9KfTrvRAsXFDkVeL/mQ/sWC1
	 owYNfMH1uH1UN86FT+PGkM9NKfN/VG9dd9qPt5qLJqOzSFK0eDkrVPDMgRX2pADk1Zhi4
	 yFnZ2duEXqq+q//5YG8B/2f2wp7LrWcd0YURxx1i62fMhHgZOtkmppBkcYuf25T5NI1lA
	 RjilcE8zMGhv8hhUoU0Ij9NIPoT0ttrFpuuAltUBP7umKc5LugkLdvtGeteFqvLYg6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=btv88EO4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hvNpOUWj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B2F606A32A
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 17:28:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1B2F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=btv88EO4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hvNpOUWj
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ALFa5hj909121
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 17:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VSSSORsiisY1CsQn0K2p7M1sRt5FkQmSwTkw4vbiEU4=; b=btv88EO4gLrE/wpV
	APU4YEKHiGrjzbTl3s7A9Xdg4MR92ZdUmE8JgJZ/pIIxZoHF6+zgW17giNC2zrIC
	oZXFUeB9DYA8dyMw3OinB27J5b9ng316zd1bx8EP9uFVCkyaguYb+WcdnSLf5IlP
	l8IwZRRUy1CcQl7G9yYOUdPeEvbLmK3tE1OXqatFm4XqdvtioJa0+qRHDXcV7vl5
	eKwryv7vxbpNrfXXOCkxF/BNQnV65wZQ5nO6JesplMl3D/2wT4k9DkDSRTTMbbNr
	X55RzipZmnoB4HFurSTpBhyDGMn79JqYpiSoB/bcvO7pTpMHbW8JVy8LEw5jzTMX
	hxRkCw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33h31ms4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 17:28:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844e383so338912585a.1
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 09:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795282117; x=1795886917; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSSSORsiisY1CsQn0K2p7M1sRt5FkQmSwTkw4vbiEU4=;
        b=hvNpOUWj2mOLQgeVjCGfb3oWAQh/+/DyJ7V8rIhRDHu90XLyze1fZKa3GvCIHw061o
         VQNCkVE2TvN7bfDibklADLl+F4m9gmIro4eqJLOXKM/Zu4Cggg0eqyFxw7ecVoC4gPes
         s/ojNSzCfjerEw1ggNZtxgtQDbGl7ojzVn4cXnZGRHVSQ1ZA7zLbXyHabqWElzkfKvHU
         hZ6EqxYx+/s9fkAwOv5ACTaLRDnmc0SqzPNQGLH5N2+zzxSxLow7S5DOc3WvFNGhjLvl
         Zt/I4zftLAGiQfF/Lhq1b7c2+xHyMFyaf8OvcWFo9zseDY2nj97VfFvn1cGCLAxfu4U9
         I6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795282117; x=1795886917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSSSORsiisY1CsQn0K2p7M1sRt5FkQmSwTkw4vbiEU4=;
        b=a9VBue+VmVYYgIbIrfyfHT5pG4diMODWD4hzI8y6yguZM3ib2SqW8a3j3vW9uotX13
         YJje3Rxo/gEWTr4NXb+oxPWuaH1iqErEd16wd0W7LE02IxvEGOSDukHKWitXgsVG60O0
         odgG8D2XfldcdZTswZs6PU9BCy7BAT4WwObyC/9LhJk0BPF9DzO4Nk3Bs7PLrGwyiRCV
         +sMgicGEajUd+9B7mBpZYqLOGy/1ho3Zauya73mTwiXRam4sdSXjoQV+0M/9D/leNWKf
         gWZmrscbg3Bwe7Q1WZK1ATPpXG7+rvyyq77huUegPK5xYQVmGNIe4Ajj8YjVO/MCM5nX
         luGA==
X-Gm-Message-State: APuU4Z8hsiDryJfPFz7Rm9CZQa3N98/5GhCbQy/P5uRdqqlU5phcFqmA
	cnSFSuOBUwr5v8+j/BsD2rDd86wowdMXWKUx/jqZrfTfoRptoN9Lzs9h+cbfX8ipmT4XPkMBKI7
	4hvTYpKwkORr7VN7hafzObH4PRkIvOTqpnWz/f2xbcDXh0Rc99AFvqxaGFVY=
X-Gm-Gg: AZFdTZd0T92dXpc9iLqAU/3dHGyxtu1O1RxL7X2S9pw7Q6f5nWk6hrz3Vai3TbHJWeQ
	+Yrw9UkBHC1EM6fjT2o17llLc35l2+9pmFAtaSeSl+NNR05o9GEhwM7681s1VwFc3bmOPezIEEq
	0ns284+iU/b+0Lu/+JfBj6+EEL4FdSsAZH05bjCoHirFpMl8f2HCujTJDnUz6POyAoCwQUnZ+bV
	V3d/i4ueZQBxkEVOdyC6gX3hlU7Sc1cAfribFlkxJILZ5V72KwANG6gJgwB4F9k4VbDGh5RiY83
	1Nyp3NtgcKqDbZJ7MCZ2bcjlQqHWuKO8br10M2MNVBIL0hPrb1dCnDrdCXxXOmLY5dm1+1aL/Ia
	4MDglrqhoN9S5ILmA8PhNST0Sj/3L57fSmFwTdqfCSKOUN985E68pgTioyfzwZFC2mdIr7VZXFC
	8uCq5U1cK4fSerbj5TtwOERXbpwXs=
X-Received: by 2002:a05:620a:6508:b0:949:6e1b:7cc6 with SMTP id af79cd13be357-949ba690a5fmr1084232985a.0.1795282116950;
        Sat, 21 Nov 2026 09:28:36 -0800 (PST)
X-Received: by 2002:a05:620a:6508:b0:949:6e1b:7cc6 with SMTP id af79cd13be357-949ba690a5fmr1084226785a.0.1795282116313;
        Sat, 21 Nov 2026 09:28:36 -0800 (PST)
Received: from localhost (net-188-152-73-83.cust.dsl.teletu.it. [188.152.73.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c248b75sm12685687f8f.54.2026.11.21.09.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:28:34 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Sat, 21 Nov 2026 18:28:13 +0100
Subject: [PATCH net-next v12 2/4] net: xdp: add xdp_buff_shrink_tail()
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
Message-Id: <20261121-stmmac-rx-mb-v12-2-3ae2f3bce174@oss.qualcomm.com>
References: <20261121-stmmac-rx-mb-v12-0-3ae2f3bce174@oss.qualcomm.com>
In-Reply-To: <20261121-stmmac-rx-mb-v12-0-3ae2f3bce174@oss.qualcomm.com>
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
        Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bpf@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=EsxHPicA c=1 sm=1 tr=0 ts=6b01d4c6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=7V0IxQAAFVITDsu0YkUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: avV5_wPkI1y8osUT9B5L2Gnsj9qxgzku
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDA2OSBTYWx0ZWRfX3hGkYovNDdof
 JEUvBg3f74QVrXzQrhrsUL8gerokPgFYrngQJfCw0pGAu7kiJLYt5KJwuxXrZhnPRDe3ztls5//
 sgfgYeVutp2WskLHpz8qom8+cLf/occhy70rvkps7AgNeDhfWZO+IlguEUB8z9PXCKWuEBNM2OJ
 E8OZJsiW1zPC6mtd5FzY+KEoMvs8Y+tXFloNINKT8GdGw31TNC9QHUXrBZabG+annZENZkED/Xu
 cLd3VHgbGH35HzfGV8QVRxY7aV/W/a1p5pLgKoAxy4xqyi0wqQc3Wii1c7Q7XvfI+hJzHer/YaN
 s5W/RdQpJ8E/AbYjd9b5DroNgnsCdb8zDXP9v3P+UZXebvU2gizbWHs7WV+u11hcC7JfjhyOSGK
 iG0HA1P2ObAxxidMkVf2Lf1uZOgHt7OpiIgCqnYw9MsZi1J+Fv+KtiHJrz1HC/BWnPrwzhhbh3i
 iTYQBKJPHWVeWtQl6pQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDA2OSBTYWx0ZWRfX1kuizjzkY0zp
 W7D2MSmw7+3wB2HYPG2rbvY+tt5Y0AIPeac5nmR937tHdSMZAJu4No9We/YF4582IBmXpFkAuVk
 49d4WAWEJ0vrRRd97VCdmg7hgnJWNhg=
X-Proofpoint-GUID: avV5_wPkI1y8osUT9B5L2Gnsj9qxgzku
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611210069

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
index 054748b37d7d..3400775d179b 100644
--- a/include/net/xdp.h
+++ b/include/net/xdp.h
@@ -415,6 +415,9 @@ struct sk_buff *__xdp_build_skb_from_frame(struct xdp_frame *xdpf,
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
index 0db2f68afc5c..acad82982d77 100644
--- a/net/core/xdp.c
+++ b/net/core/xdp.c
@@ -676,6 +676,95 @@ struct sk_buff *__xdp_build_skb_from_buff(const struct xdp_buff *xdp)
 }
 EXPORT_SYMBOL_GPL(__xdp_build_skb_from_buff);
 
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

