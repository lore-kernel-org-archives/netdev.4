Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920342;
	b=GdK6G5/R5dJWQWpd+wqIhNAsVe4TE3loNsmi2L+2M+I8d6DB1TbqK760v2y81UHD+55g
	 n7xroceJhzRRyj6Acq9GNjmRNIF38x9mSsItm1cGktCim8oOUT6SitRaoQR814TaofIDs
	 jYvL/Ew72JLQ6n9Cee1pLJb7DykNtdHFQYKjR2vAZEpFWkbC8gt69gtkSX1QeAlJMw+DV
	 C57TJspxjV2bNj2WG7v6LZNo8T6ujGpF/tcOJyKRMzclY8L7UYhnntptZPeuDrDd38yGv
	 J5TyVQSXtgnO/AbA/07CsNWbdt7uGqAK4whi+e03VKyX0mxtzmBmiQoeKns0Cr3WM0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920342;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=s/2ub0vL3CaIDBF+BZvv9xMGDewjeSC4WNdbIVGz2Qk=;
	b=Gpt88CMAohOYVYIClvyAb1KZuiSGOLZ2U/dDA/mJ1rUA3V0+Tih2Z8cI6MteS3KWv98B
	 cS3jg2sN3qdXzaEaqUsg/E3Z7DFOIAFgZ2TzCvprVtp6EbpLkZoSIeY73DOf6aMdCBXM5
	 TU7ILIJFVF0wHxVkhT4gz/bgVWNCdfEQqc4J4lLtL2nMwhuRolhSsTqvt82pzaP7tU68X
	 NLag7fmX04izCc4T/MGj582ByfXVvjlXj1Uf4rOncuhKai8oxV0a1YwOQFj+nf2CnY6lm
	 Zh/+pEWrPJYjV4oXJ6QDRXmuGw9floZVYxk7CaGf6WiIq4jeehett7w/VxUhnE6PRZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=erLzjBQS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kcjRH1tF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFAF606A33E
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 12:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CFAF606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=erLzjBQS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kcjRH1tF
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC17ZB081958
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 12:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s/2ub0vL3CaIDBF+BZvv9xMGDewjeSC4WNdbIVGz2Qk=; b=erLzjBQSTtFHGQmt
	0smMLSZgebGlfltudacnsNitWoc7RXJVmij2ba1QWpLNBOxdkmHSQnHltnA1wOth
	aikZGjDLg2jElOF4GMUjP78Q+Qshe4jKQM3TObScq3pmShFxbX7MMw2Sr4Co7wRs
	LwZX/2VLc4Sz5Z6vabUSLQ7K3CfWd4oF3Gya+t6zSY1XlM7JWd7XNz2i5hbAvW6c
	GTXBdhlnGcFjea9hPX/Xny/Nu999SVFCbh4uJzvOj/iR+7Y51T5T2KvzoaZ88fZa
	LvxIXYhpkMbAnOq+0HjoXEFHbOAdQOmaMl99h519x01vUSS6a7nSpw6mC1metISU
	Pp/w9g==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0gfr1rbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 12:59:00 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99c47fe8cacso3797164241.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 04:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794920340; x=1795525140; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/2ub0vL3CaIDBF+BZvv9xMGDewjeSC4WNdbIVGz2Qk=;
        b=kcjRH1tFfIku/wDI+VnQVkXlmA5MGxNknPXxQJW8B8sJ0xJn4oIL2Z/n4feAgFa+iV
         6gM7ifYG+NIUiNegJ6A4Py1EPvgC7PWTXxrBSrNtNSScrJP0OkGjbB4KzZRITmwVbtOb
         55IywC30qDQufIihVQiZ2gpOP7hsYOhuMlc9LdOIM5NGNqigP8/wK7NrCuYG+99ptcKO
         AL8SrGcZioFcJxKYDWm/zwwW69R2wSMJHo5X8qDE1ORQO9oKe6WB6vRYGsGLdBBWL4ST
         0gNXpt+HECd/oEnWcqybKAlMzkPHuLkxEwfenZ+Q5Do68bjjFlgJNvPjwY9IuNMW3gT/
         dXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920340; x=1795525140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s/2ub0vL3CaIDBF+BZvv9xMGDewjeSC4WNdbIVGz2Qk=;
        b=PCtru5o9fTT8c6VLt8u41Ca6HvwRIFO3M4K05Zug3OZGkQuX4ZFDGrZnk7ETkzDrIX
         UzTw8wNY8W1NU5VVn4b0GUcA/L160MuiekiDlIyLnoowFZnTW5r4nx5GG1emoNEd/9Zs
         qlaKl5Lbj0DAT1wHnaVHux9/NgQscedhVYp/OFJoj7bb+ZPsyaV75v/9DQMeAAxjTiHS
         WE2XsMdrxmCBBhDjMPJYtNtX9zH6LcgdNtbbohEKGj+5H7SuD2NAYgWEEIxw/02VRRT/
         ons6T+iCBd+NLeE3Pq5XfUspsZg7EOFLdyskaRIQakjyx2li6Rlz5w5l+x8O8UDQhsoD
         Wy0g==
X-Gm-Message-State: APuU4Z9tt1KI4adYBikxJ61tip8TH3X1s02KWVvOa2hbjWYu+6A+Z8en
	VmsDUjSKcApY7tLP+ZfCDcp+c9HSFz48wIcf3VSjyBrSntXnzk3nG5GLpKsL8WA9XCCTsLcVuPq
	pq2taTuDxTLHviMhCVxMgm86pF56Qy6fjcO8BJ4fs9fulXdcvNOJ/CE3AYxA=
X-Gm-Gg: AYBFou3ljX+GZF8lu7OLPCYUo6h8yMppaiDiENLB4aJ8HrQ8knCGkLyEAtdzEuzsQsu
	8ooCcU/Dnt28qFQgmOaxhtgryvrwI/pGe0U2TZ3bSE0YjB3oVcRaJk8LnabW/QwqvbKIQMeECBR
	G4xIscmSldHTkjnA/2q+Tu/Mpyk7ucinJlIMIPBwPiQZhz5oiuq9rxP14W5V9KiByM5jJ1lq6CK
	l8WyYQJzRD74yFGeq6XuQgPL6FigU/LqEXiZ/rXfTg+NB/gje3iM0opw3/H4LjlbccfVX0JvV94
	NT7uIpGhgA3kgZR0bWk9ATvYTv2KMErATY5ehgKj9yHhnWOXXJjewBa7Xzq8XRq03Vm1FC3orhQ
	5WhUV9IJ1QV2y7aqH0QwUB9DjO0svVW9MG/mSZfxaUuv6S1ccucqV20CrbNrXhzQ=
X-Received: by 2002:a05:6102:548c:b0:7ce:6289:314 with SMTP id ada2fe7eead31-7d64d72b1demr5233239137.14.1794920340258;
        Tue, 17 Nov 2026 04:59:00 -0800 (PST)
X-Received: by 2002:a05:6102:548c:b0:7ce:6289:314 with SMTP id ada2fe7eead31-7d64d72b1demr5233222137.14.1794920339653;
        Tue, 17 Nov 2026 04:58:59 -0800 (PST)
Received: from localhost ([188.152.73.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7838c912sm60545435e9.4.2026.11.17.04.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:58:58 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 13:58:29 +0100
Subject: [PATCH net-next v11 3/4] net: xdp: add __xdp_return_buff() helper
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
Message-Id: <20261117-stmmac-rx-mb-v11-3-9fa5c34ef245@oss.qualcomm.com>
References: <20261117-stmmac-rx-mb-v11-0-9fa5c34ef245@oss.qualcomm.com>
In-Reply-To: <20261117-stmmac-rx-mb-v11-0-9fa5c34ef245@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=X/rHu2Te c=1 sm=1 tr=0 ts=6afc4f95 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=EPvaxb3vtNQ3FCvCQEgA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: 3fcr0Dpu2gaZftQs-zwhaB6NMHr_maSD
X-Proofpoint-ORIG-GUID: 3fcr0Dpu2gaZftQs-zwhaB6NMHr_maSD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfX3koNvXM02hPv
 +iqMGL0wyVqx0o9JjLOhrabHEmJdjxxgPj3G/AOHDzm/w1Wm3H6dFsJMEvvBsIaSMZ/TRQrqr+R
 VuDK6jMa0fssLyy6kv9LSsZQ/ouihM/526EjOxANBZkCU4rk6z95aPFQ4gF1EnR2P6HL6KozfmN
 +i60u+70TPlQoLBw0ZG8bkr1zqxPt0CCZ5hckPKuep4n5VRZHZouvMXse57DMUBHAsqS1hvhoCo
 inrvk/e8ZWtN853Ai2NTttmjSdffRUZQBsP/X7UROBiDRvCtJP5VJ9qiabsV4Dfc7rPZlA9lSOs
 UmD7mk3exzC7pbCNf2IqMXz0EDyHoLjNJkeHfNbkWXIVc2W1FiOS8JnY05SBEigcFLqeLHi25YQ
 JLyzZKSrPjxN2E3uHmXmvbrfB4JzsjzCi8wuQCISlccOzcFFat12jkRepoW213Ri/1x7xpjyWPV
 y7+Gk3ZyCsvwsBZ8c6w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfX/Bs/oQNNpvx3
 hD0gwOw0wDEedIL1f82DPxD+mmpYtqalgwfsCdUPOO1d4TFkXUZ/h0sho5uUoO19CeBYgSNuyAk
 TgrQGpwglwsVIRNkHhi/n8QW9+37N6E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170051

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
index 3400775d179b..2fc972f71509 100644
--- a/include/net/xdp.h
+++ b/include/net/xdp.h
@@ -484,7 +484,12 @@ void __xdp_return(netmem_ref netmem, enum xdp_mem_type mem_type,
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
index acad82982d77..1dbcec0b31ff 100644
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

