Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618163;
	b=ICFVJ2oXRkm786C3JXwsku5IdYdhINf2++JOc9RzneY4kVlP+9Pvwb9KCQ4Gg2TjlkQd
	 uua6DEo8hd/qfvqRn8s8woDHlvmt83vL+D9iahqIhTKqnONK6ub340TwviXIbyDei5f5k
	 Ifjg1vsBwGhmNPVMKhaCvyeWfB8powlj8d65Yf9SiAxVcRXO+TygTnmx2C7ka28Hrhesy
	 V5krvSklcBhCVPs6JUSiNcfYjpf1ojaGtb/pPWVk8L6/l2zXurZcOoT1c8wBwNJKBvpGZ
	 GjVd7gUBllbzWn455CYhKEyV4zmweldnivNFqIESBRXg1p21vhZYbD2a2DR22GEHGbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618163;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5bA2dLmzqgo3bDop9DwrX5y7CzbVAF3y/Ym4vkMUybI=;
	b=SK+IR3YE7yUd4wBgi/cs6tGllbL2cxZ+Pj1cHxkmmRRkaFTYW73HOD7Uu9dIujzaVbCc
	 S9/CZdr8rBuRnbM8ixAMOtGWjYDNKwUKCm1T/SOPcUbg5GdWg223ZqgGzcCQ6C/6k69dq
	 T7TOMSRymGNMvgZQjFEA+CuY/qLqtzvCVPeIuzxPtlmB/99vnj5OVVTPspSilirEDE5kc
	 pU+hPjWb2R+Mv06UtIIRzvxfylEVkEtCJsgtMnFgVkESwaYRjARJXVI1+WTt6syjvM1fg
	 PvuRZM3dUDxSobb8ClBhxFWKSyagxCjJUAGO4YXw6VMRkO1tb/CNizbg2qyhjFpWZDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nN5HuPAe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eqikgZkW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D545606A326
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D545606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nN5HuPAe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eqikgZkW
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APELsUJ3725638
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5bA2dLmzqgo3bDop9DwrX5y7CzbVAF3y/Ym4vkMUybI=; b=nN5HuPAep8TQmsUz
	XdjqnsWFEgrmwYw66IBMyL1fbRjmBC9cG3Dzo+82Md8geoDLRIGPw2hjZQKphbx3
	YmTztth9BBm2pLcZBKO+gdDEOSWhUymmwdPN2LnQc1km5UHaLa7aCOsryf0cxj/n
	mQ3llFhrsOlM0XalDktbU/iUIeZquze6ne5pTs7eGVmaPQb+q4Tcum8NBC218JWy
	m/1L2QfbgA+WpzR4K14L1vUS4cH0JLIes56ahlF2+WW83Ur6jwZKSToMhwk6qB8S
	8kR5SzqEmSXAvOprGd/aZLqIK4AmsweKVHXDwtteL6A/eAwTsXUk/jM57kxMCaZb
	Y4K3qA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61af047v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:49:21 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ed100ed770so526616e0c.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 06:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795618161; x=1796222961; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5bA2dLmzqgo3bDop9DwrX5y7CzbVAF3y/Ym4vkMUybI=;
        b=eqikgZkWMkzAeEqq9lsgeCjw+aspioU17NUdcOltDMeV9G911NzBSK9haz/yWqxfZg
         95YT0mA2t2etQO0HVugly9YcKgJpqVjk+csfUq3cb4MOM0QHdoEdPyG9Fgww1PTYRNr1
         C+L+q8FnyFT0XNsZ3U3TUVDguxEg8WHzHEkFcK+439xjvU3A6pIepj+Mc1+SJCchz29C
         vzmRsyhTYItgBtu5odRxZ8lxQTnf2CCwgeCPi5BFzpH2lgqCKaSuc/eM/BVX2uG8CBRh
         M0+NnuHu/Iu/zS5iOo7pRmk/h6Tqfdd78Gq6gAM5nlGirZS9hnvsYWoraC2bpV5hHs9g
         aOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618161; x=1796222961;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5bA2dLmzqgo3bDop9DwrX5y7CzbVAF3y/Ym4vkMUybI=;
        b=VtJAXQiAuJV4OuhV++loVbm5ssm+skxzegBK/YS/17w/W5IvHIiDd1i3yveJyV4jZ7
         q0oEwdh1HYRhc4fUk4pHN74gV9LUbDTwBr1l/7Z0fOnUb39WGUvqI9dx/NPoqUaQHxAa
         RAOoieDf/1ktd8b8tZl6WakrO+5HdrTXDUGGFUv/h4NNWpKEbdU4VGmWQ07DTg/QYwCx
         fauoxe99BluOuP7JFhf4l8q4v3J1HeJyjKFrs/mRZ1Y4UyRUbRCve/wLjxjFEX/TVxL9
         4uMfCCBBU6AjxCP4xdLnzA1/3h+Co2gkWdM0jVCTiROFFs9Zh5fsYBTr5iXg9U5SJUbx
         8tUA==
X-Gm-Message-State: APuU4Z/SknAblYP7a+D+kzCN59Lc3MJnyABT5nVujM/etvEDerqZTtCg
	j7Fo+b1HgzmwsIyN6UUF/d4X5H62uiSEXuKxbc0B0GP5xRsQL3i6IBZDRow+bKzLAMXYCKlgvPB
	ZSTQk2xsnyXH33LZ4Aazn6GDYlGcRu6u2AeIyxaTi4uvhJoMMnW7Ci3ia0Do=
X-Gm-Gg: AZFdTZfb4P0ocjBMPO8qDiMo3uHNuurGzXtV7T3d2+6x9jVwUlahSCyi+QYM3Nom/VJ
	oiQT3pnzjBWRYYIQ4CriefmEqWpoUe+0p9pVTEMaqINAbzJHaFBGYw7uadyLyE4TLzTAEzG6AnL
	4axa+Et83kapqZxjJgkOZGjVKfWl0+a01Fw5tMzL7JV3riMqYV6Wk432/LAadZDZ1sYlWHZL/qE
	R36cbJF132Pa0igGRQCPOMxj0NXxePCPhuIHVqDTkJ5ZoTEFjWQLvf1SFvVTJB6k3SnAvLLh8XC
	5m1AbDzR0kgxqYS30keZAJpsbuffpFcKsaHuVEoPH5kJJcw0M6IK5xfmeNjnGTKk5LSOKWjWkfL
	pEFrupEeTDmv7wmuTOEn1Bf+fCcZLluHPiW9ZRxjFYIgxY/rE/uP9Zyr/z4SWDC2dSD97Ia1w2W
	enbvmojyXrEc5cJktxoz3EYWcU1gw=
X-Received: by 2002:a05:6122:4f97:b0:5df:682a:5d14 with SMTP id 71dfb90a1353d-5ee8aeb79bcmr10154539e0c.4.1795618160468;
        Wed, 25 Nov 2026 06:49:20 -0800 (PST)
X-Received: by 2002:a05:6122:4f97:b0:5df:682a:5d14 with SMTP id 71dfb90a1353d-5ee8aeb79bcmr10154418e0c.4.1795618159458;
        Wed, 25 Nov 2026 06:49:19 -0800 (PST)
Received: from localhost (net-188-152-73-83.cust.dsl.teletu.it. [188.152.73.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a12acsm554109195e9.8.2026.11.25.06.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:49:18 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 15:48:49 +0100
Subject: [PATCH net-next v13 4/5] net: xdp: add __xdp_return_buff() helper
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
Message-Id: <20261125-stmmac-rx-mb-v13-4-0f6bac53e8d5@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1OCBTYWx0ZWRfXwDoOGLH96IO0
 aIxjgfR9VYPay2n757BrzlLANQYQOvQFdBNfQftiK70GpfrmC8CdgyS4cNPipjV4Q80BxKusX+A
 i1gW0j8rcL/gZqVJHQ1trCa3fM84vZg=
X-Authority-Analysis: v=2.4 cv=PdhqFShd c=1 sm=1 tr=0 ts=6b06f571 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=EPvaxb3vtNQ3FCvCQEgA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: ogipAUXl9atSEuyMu-RhcR41gcUm_mhb
X-Proofpoint-ORIG-GUID: ogipAUXl9atSEuyMu-RhcR41gcUm_mhb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1OCBTYWx0ZWRfX8O0y11MH5v20
 ROL7KoP7zzOQeU78A0nRVVN8UTT1yRutYumu4IY/+FtVCsAaQ0dYFB3o6n/JkmMtYJwFRYry8id
 Uouq6tcWvanUvxKexfmMoJbNJDEm7X6SeYKsWro1KnnxET5TzgbDH6VRKY4xoxCkN7AlpsnBP5R
 e0hPrZfLO64RN37nAiCFfnI3QuJlzUDRnRT7kKYS37R6m9WeOu1SoOHcul52IhH6p5Dx3JSe+sw
 ZbHINTrgqTvpI38OFPJuATWnW7geDwNtguhhj83br6vVn1pRLimzQFKZBhkQ0NARZOIiyq0QTOB
 fl6rtJJy599A0G0FsmU+H/zz9QGfSUUbhx5HXPwYIEGcQyLoqWiRA3B4/XJTNa/YuWqa9BeAuX7
 3h7TfEvgNhJ8qa1atWOO4syvxt15Oaik4WCDBQ28IaIrxo0D1cfM0wqwPb7MLsVYfVAmLoO+Q7C
 0Fo68TWOpjpmLT+szLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250058

xdp_return_buff() always releases the fragments and the head with
napi_direct = true, which is only valid when the caller runs in the NAPI
context that owns the page pool. Drivers also need to release an
xdp_buff while tearing down or resetting a queue, where NAPI is not
running and direct recycling must be disabled.

Split the implementation into __xdp_return_buff(), which takes the
napi_direct argument and is exported for drivers, and keep
xdp_return_buff() as an inline wrapper that passes true, preserving the
behavior of the existing callers.

This lets stmmac use the common helper with napi_direct = false on the
teardown paths.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 include/net/xdp.h | 7 ++++++-
 net/core/xdp.c    | 9 +++++----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/include/net/xdp.h b/include/net/xdp.h
index 02289028044c..f0946500c487 100644
--- a/include/net/xdp.h
+++ b/include/net/xdp.h
@@ -457,7 +457,12 @@ void __xdp_return(netmem_ref netmem, enum xdp_mem_type mem_type,
 		  bool napi_direct, struct xdp_buff *xdp);
 void xdp_return_frame(struct xdp_frame *xdpf);
 void xdp_return_frame_rx_napi(struct xdp_frame *xdpf);
-void xdp_return_buff(struct xdp_buff *xdp);
+void __xdp_return_buff(struct xdp_buff *xdp, bool napi_direct);
+static inline void xdp_return_buff(struct xdp_buff *xdp)
+{
+	__xdp_return_buff(xdp, true);
+}
+
 void xdp_return_frame_bulk(struct xdp_frame *xdpf,
 			   struct xdp_frame_bulk *bq);
 
diff --git a/net/core/xdp.c b/net/core/xdp.c
index 055931263413..f35ae7e118f5 100644
--- a/net/core/xdp.c
+++ b/net/core/xdp.c
@@ -546,7 +546,7 @@ void xdp_return_frag(netmem_ref netmem, const struct xdp_buff *xdp)
 }
 EXPORT_SYMBOL_GPL(xdp_return_frag);
 
-void xdp_return_buff(struct xdp_buff *xdp)
+void __xdp_return_buff(struct xdp_buff *xdp, bool napi_direct)
 {
 	struct skb_shared_info *sinfo;
 
@@ -556,12 +556,13 @@ void xdp_return_buff(struct xdp_buff *xdp)
 	sinfo = xdp_get_shared_info_from_buff(xdp);
 	for (u32 i = 0; i < sinfo->nr_frags; i++)
 		__xdp_return(skb_frag_netmem(&sinfo->frags[i]),
-			     xdp->rxq->mem.type, true, xdp);
+			     xdp->rxq->mem.type, napi_direct, xdp);
 
 out:
-	__xdp_return(virt_to_netmem(xdp->data), xdp->rxq->mem.type, true, xdp);
+	__xdp_return(virt_to_netmem(xdp->data), xdp->rxq->mem.type,
+		     napi_direct, xdp);
 }
-EXPORT_SYMBOL_GPL(xdp_return_buff);
+EXPORT_SYMBOL_GPL(__xdp_return_buff);
 
 void xdp_attachment_setup(struct xdp_attachment_info *info,
 			  struct netdev_bpf *bpf)

-- 
2.56.1

