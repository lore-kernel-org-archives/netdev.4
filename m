Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795282116;
	b=wvlyjUDW2tfTSvBV2aaOtatPLVDLyhz1uSRBzhBfsfg1RcSACYwVklLDYgXOt4X1frGM
	 sXJ/1zF/3LQu31kSAE58WeSCHrP7yMo0uFKLBawSHrXJ33/CPrc84pTZcS9FegVRH6v+p
	 GB+z2xvizxYhi093/8t/CGhY1CtQ0UNS9EwEwo95KwXq+0/bGpaScOATZSykIuZvZuM3c
	 a+0JIfXaPg0bdaYRVJqQkSQ3UebjgaeJcJ53pTKYKyu0XbmJ6a1cueL33DaqNLf7YvvEj
	 MtxhNzpFuYEjDG5JRbGCy/A8rXP1XrKi7ijZ9AStORH9cvttQA0ygNaph3hONek6kpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795282116;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=heUKnejAm5jGj5TLnTY1uaqlIyiHEz5k7ilXGa71fFc=;
	b=x/DJ1xc2RGv4+SqG6GTgN/1zYanTENSiI/GYyX9wRQR+yl2p0lWEGvQ7Psw6MUHarbfm
	 FHIaPj6HC9XbnumAnRVHDA0WHc7+Rv+jcNcr/JcmdfYKMWuPOWmO+kNDcUwSG2ywH6cF2
	 iL14/f7a2FvMMTGSsAvln3EPxWTuIu2BDRDO4LtLUUXAu3Epp036tOesvDEU1oXg/Us/L
	 A/Yjkp091eDa7glwByvCagObHp4ms2X/23S5RJ/tkTOQEwCRS0vJ5b5TTSXvhfel3uguF
	 pqrtFlpnYPDH5U+t+rsDQZ1Xa+36ZKXQG5XtxKHfnNAFWSezJzCsbQnPqddxLl/P9YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gRiSyNEm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TfCw6UtO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D38606A32A
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 17:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73D38606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gRiSyNEm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TfCw6UtO
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ALFaBM93431871
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 17:28:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	heUKnejAm5jGj5TLnTY1uaqlIyiHEz5k7ilXGa71fFc=; b=gRiSyNEmHndj6876
	96wz/7K9Z0Odna6gDmMRy9uLSoQqLAOM9YHag3+ctAPHwxRwtfmKb1HB02yZIYsn
	+l1J7Hzgjs2G7Wv2ZzX5eZkaGUGw5qVsf2T46PiWcBxkYZicW3bUQ4QEDSvVT32X
	cPBr6IbBwqk3NDfmwC9KEAEPyeCw5yTlZdpsZePShyvA8i5ojq+2mFYNHgGmebbv
	89PFa/3E4h+69co5QyANzsuy4dU9iBHDwTVbHrzho0hoF+C7EOn9b4LJsVaRqNQT
	Z1QfNw7FIRfdoRxvjpB4WILdXOK8Gvqr7SBu1XkIlzKQUQ2EwtsD8ga+UNcBI5ex
	cWG0yg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34fk1fhd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 17:28:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94967c6d4f4so222626185a.2
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 09:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795282115; x=1795886915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=heUKnejAm5jGj5TLnTY1uaqlIyiHEz5k7ilXGa71fFc=;
        b=TfCw6UtOz/LRgavta8xT9vmEZWwDd+Z5SkJGA567u0iaSL8+8QD67A8p3urEcyvksF
         PANcLIIeJUyocRY3NgTMOiRpNqoxCHqGFDEFDEj29bbcyUTaJcP95FMJ5L5hX17TnnTU
         7ywomoAX+cosr6woynliQUZyMRNuZf9biNtn9tT4hSluHl0aqsOLGzEdIzmjjyygPPH3
         MovBRP6EyuCtKCEYXeBgO8xbkbLQsBVAPvXRV5jNVCbe4UeY3fwUvdDPjH1ySzIJmbgd
         Ay3hhPqwfrlmFHf4PBG1DW86XXqjNN59OwHTEQqK7WXAblUmiWryzoEOnTWVR6AibS6K
         42bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795282115; x=1795886915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=heUKnejAm5jGj5TLnTY1uaqlIyiHEz5k7ilXGa71fFc=;
        b=WwApJNeEWvZwi3ctMUKgZzTP64XeruSPFwoaHBmNtrIqAaD80yOuUDlUxSY0amiOzA
         gyD9K9uPiog5EKyYU7A8NJEoorUw5oMGAqRXJTnKq9WIGw2E1e3EchdXb2WkssjGRiNH
         1v87Pc/7V3b8UiZCOVX7qTfzXs0BnyabtW64Ew7LwVShsfZZNd9ppvltm7N38QFerN7n
         mdthSYekCGAPfqhPlaqhe9aV7DX1BqCXU+M/dSZ3v9iVHjwFfECFvt1ms9pD0eCVuHKN
         pxe5NVnBAlhRcGmHQiZX7j1fApY+4c1XlMOrrKxTnpamrMbwtdUU+AqNgGEK5Wob1NuS
         DlNg==
X-Gm-Message-State: APuU4Z/umKK+ipOAG3TK98107ur5/aTyd6uxqof8aAZP14uD/it9RwF/
	QaPwORtF0j4rEasZdi7mEeloojn1G2Z+tdZsJu8ItmarOSHRhIdx1vleqLuGVpx3+nJcqDXtW67
	g50cRDXY+rMiwzLTuERrfBMwoeo2K1SRkDbUcXMxqKgT8olzKJkQYqfwzxF0=
X-Gm-Gg: AZFdTZfBgzAYla5rx1PLc9jiEuJhez3D4zEi/fgx6imfBRrO+4zno8TWu7bByTkogHS
	GjmpYhJQYO1uaeKdS7zBC434o2VT/wOV2o/2l6YPwDz/WIkJUZunYJvbo4T0DRSarTYFa8tSOwl
	lXCxWn35NolqONttWGczzEvwzlpvxcjy5CffAsBNGkuxJoB6hkR2oV23KdLFaFdoZGqHrpqBn/C
	zBu2a/6ZYAZs4U/MU8AeEbdaDmCSBevA8NE0hMcqB6TG2vmAKVGbkvHx3e14L5E8t/niqngIJlG
	68+ffrT9vgXC6SYtrPkgT01xPkp+c0Zd05eBIu0DByJa82GjQter09bltmdcbTu/1y4LOTa8/fN
	1irot42eTBZc8gvGTpY8dHn/5KPl4a6SS0Sivpou5BbcZjXWo74jCjlzufSgCrv8=
X-Received: by 2002:a05:620a:4446:b0:949:70f1:de2f with SMTP id af79cd13be357-949ba8260f2mr1052546385a.8.1795282114619;
        Sat, 21 Nov 2026 09:28:34 -0800 (PST)
X-Received: by 2002:a05:620a:4446:b0:949:70f1:de2f with SMTP id af79cd13be357-949ba8260f2mr1052542085a.8.1795282114034;
        Sat, 21 Nov 2026 09:28:34 -0800 (PST)
Received: from localhost ([188.152.73.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399d52sm199723775e9.6.2026.11.21.09.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:28:33 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Sat, 21 Nov 2026 18:28:12 +0100
Subject: [PATCH net-next v12 1/4] net: xdp: add __xdp_build_skb_from_buff()
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
Message-Id: <20261121-stmmac-rx-mb-v12-1-3ae2f3bce174@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: JaDycoDs_7_Cb5qfPnbn4iatCHERT4cA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDA2OSBTYWx0ZWRfX9yolp4giK9RA
 ykA05KZxjIKIqVhksNB1gKhlzmfzsWp1cpfxbXs2x2NN+vTQ3qOqM0F/9/hhseLLTUi/zqtRvlS
 88jnKCqHur/lSN4QkHEEp5+viT5Ta2DbwnEZ5txGPd0hDHhE24bSBbjNO50U0kIfa2OZ7sE1CHt
 KeMzkbPAAE0nZczmzmvPYbc12Cf2ZGOvnik8sppTk7rJCf0qtcgih71UrVlYT0HhggSfawuu+N/
 Fs0Difr56ySfBoOFOTK2cFA4XUZrb5X8iYqPOwoaHiKQ/Mhp0uUvCFhnRgzHpfjT38eNCSanU7I
 +vtV0ClOIDu9mCxnEQD82pJ2aDChpav+Ch1pGrjj9IfMxWumhv5dMwtHbBaQeJWuzPzPzEkl/0Y
 LEzc3D6oUtXuCRiuhiK7nlJNLhye2ozyYUponp9dJzZj11bxKeGcQQJfbktQoMnbcRvt7PGfmbx
 J1YGon21DkpkH+EgSMg==
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6b01d4c3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Tg0PG1yVOJps9yXbb-UA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDA2OSBTYWx0ZWRfX/vk+HszeiHnN
 qkQGsiy8XFpdqG4FkwxQDs7tS/fPMn96/qDmO9niiONKKcSiLtkDKIVh5YF+nsQE/NRBanpedpR
 Gphm9Ij0c64qmaUzEXdws1IpDM6eIOc=
X-Proofpoint-GUID: JaDycoDs_7_Cb5qfPnbn4iatCHERT4cA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611210069

xdp_build_skb_from_buff() always calls eth_type_trans() on the skb it
builds, which pulls the Ethernet header and advances skb->data. Drivers
that still need to process the L2 header before protocol parsing
therefore cannot use the helper.

stmmac is such a driver: its software VLAN path (stmmac_rx_vlan()) reads
the VLAN tag at skb->data and shifts the MAC addresses over it, so it has
to run before eth_type_trans().

Split the implementation into __xdp_build_skb_from_buff(), which builds
the skb (including the recycle mark, the Rx queue index and the frags
info) but leaves skb->dev, skb->protocol, skb->pkt_type and the mac
header unset, so the caller must initialize them, usually by calling
eth_type_trans(). Make xdp_build_skb_from_buff() a static inline wrapper
that still calls eth_type_trans() as before, preserving the behavior of
existing in-tree users. A follow-up patch will let stmmac use it.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 include/net/xdp.h | 29 ++++++++++++++++++++++++++++-
 net/core/xdp.c    | 15 +++++++++------
 2 files changed, 37 insertions(+), 7 deletions(-)

diff --git a/include/net/xdp.h b/include/net/xdp.h
index 07231adfb5f8..054748b37d7d 100644
--- a/include/net/xdp.h
+++ b/include/net/xdp.h
@@ -7,6 +7,7 @@
 #define __LINUX_NET_XDP_H__
 
 #include <linux/bitfield.h>
+#include <linux/etherdevice.h>
 #include <linux/filter.h>
 #include <linux/netdevice.h>
 #include <linux/skbuff.h> /* skb_shared_info */
@@ -379,7 +380,33 @@ xdp_update_skb_frags_info(struct sk_buff *skb, u8 nr_frags,
 void xdp_warn(const char *msg, const char *func, const int line);
 #define XDP_WARN(msg) xdp_warn(msg, __func__, __LINE__)
 
-struct sk_buff *xdp_build_skb_from_buff(const struct xdp_buff *xdp);
+struct sk_buff *__xdp_build_skb_from_buff(const struct xdp_buff *xdp);
+
+/**
+ * xdp_build_skb_from_buff - create an skb from &xdp_buff
+ * @xdp: &xdp_buff to convert to an skb
+ *
+ * Same as __xdp_build_skb_from_buff(), but also calls eth_type_trans(),
+ * which sets skb->dev, skb->protocol and skb->pkt_type, resets the mac
+ * header and pulls the Ethernet header.
+ *
+ * Return: new &sk_buff on success, %NULL on error.
+ */
+static inline
+struct sk_buff *xdp_build_skb_from_buff(const struct xdp_buff *xdp)
+{
+	const struct xdp_rxq_info *rxq = xdp->rxq;
+	struct sk_buff *skb;
+
+	skb = __xdp_build_skb_from_buff(xdp);
+	if (!skb)
+		return NULL;
+
+	skb->protocol = eth_type_trans(skb, rxq->dev);
+
+	return skb;
+}
+
 struct sk_buff *xdp_build_skb_from_zc(struct xdp_buff *xdp);
 struct xdp_frame *xdp_convert_zc_to_xdp_frame(struct xdp_buff *xdp);
 struct sk_buff *__xdp_build_skb_from_frame(struct xdp_frame *xdpf,
diff --git a/net/core/xdp.c b/net/core/xdp.c
index 1d679e8fd649..0db2f68afc5c 100644
--- a/net/core/xdp.c
+++ b/net/core/xdp.c
@@ -620,17 +620,22 @@ void xdp_warn(const char *msg, const char *func, const int line)
 EXPORT_SYMBOL_GPL(xdp_warn);
 
 /**
- * xdp_build_skb_from_buff - create an skb from &xdp_buff
+ * __xdp_build_skb_from_buff - create an skb from &xdp_buff
  * @xdp: &xdp_buff to convert to an skb
  *
  * Perform common operations to create a new skb to pass up the stack from
  * &xdp_buff: allocate an skb head from the NAPI percpu cache, initialize
  * skb data pointers and offsets, set the recycle bit if the buff is
- * PP-backed, Rx queue index, protocol and update frags info.
+ * PP-backed, record the Rx queue index and update frags info.
+ *
+ * This routine does not call eth_type_trans(), so skb->dev,
+ * skb->protocol, skb->pkt_type and the mac header are left unset.
+ * Callers must initialize this state themselves, usually by calling
+ * eth_type_trans(), before passing the skb up the stack.
  *
  * Return: new &sk_buff on success, %NULL on error.
  */
-struct sk_buff *xdp_build_skb_from_buff(const struct xdp_buff *xdp)
+struct sk_buff *__xdp_build_skb_from_buff(const struct xdp_buff *xdp)
 {
 	const struct xdp_rxq_info *rxq = xdp->rxq;
 	const struct skb_shared_info *sinfo;
@@ -667,11 +672,9 @@ struct sk_buff *xdp_build_skb_from_buff(const struct xdp_buff *xdp)
 					  tsize, xdp_buff_get_skb_flags(xdp));
 	}
 
-	skb->protocol = eth_type_trans(skb, rxq->dev);
-
 	return skb;
 }
-EXPORT_SYMBOL_GPL(xdp_build_skb_from_buff);
+EXPORT_SYMBOL_GPL(__xdp_build_skb_from_buff);
 
 /**
  * xdp_copy_frags_from_zc - copy frags from XSk buff to skb

-- 
2.56.1

