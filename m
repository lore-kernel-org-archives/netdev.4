Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795282121;
	b=AMBompl8Ro2A7cZtqx5K7rrDkcd5osPO+QbEGAFeySBr7Ss4JJ3LlSmj6RKKsvFjOXaI
	 8szMLMDs22A6mr8UemhsqC68R+J1d5jl/1xOlrWh4MAHC2RDGyy1mArdz5apGy2MrpbBU
	 Hpixb5HQBsL/D+x+Z9vnaymGnBluTgTOiJZOJYvVN+19+KjwJeq1Fi3+1mONDo1wk3shI
	 AawaWXQvmI1m1Gq3rxU1KjSnGfWnUt7UT4oCa88l+CJSBMIHB9VqnXUPFrsWtnFJS0nRj
	 6BSCxb2EqHnl5mNkNSSinLnNx23HVM2kCPCKApOGzO3qQoA7ncHshXsi9CqaUXVE8bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795282121;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=s/2ub0vL3CaIDBF+BZvv9xMGDewjeSC4WNdbIVGz2Qk=;
	b=5bEzKcne0vufFdSuTYmvErZyRdqoIMVPM43Y4HWtVJgAvF5trENXB7pZfHaUecnAzL/l
	 VN6yMzGcQ6X8XA+WVxiUel4n8By3EX1Q4VS8TXcWANmDB1LPC3aGvVr0sh0ZgsIuAnM6R
	 bBEXA4/BLVywk+UC9iqZc6sBYhF65A2htXcpMZss4WFAKi6l46vUYtI+kYdxkA8ECyFDz
	 c5GZ2zFo5KmLcZXjUnEhI9M/buTJHGic94xvDkxNija7YAW9QnmOcQLXPe10qo4Nah7pf
	 GbTDtZ2PwPI9AAS/umPPSNiQaqKwjuSg1w8xcS3Rtw/V2mYyhzje37b33QD09kF68mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ncRMs/Fx";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M2pzVLDo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5269606A33C
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 17:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5269606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ncRMs/Fx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M2pzVLDo
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ALFZt1J1875136
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 17:28:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s/2ub0vL3CaIDBF+BZvv9xMGDewjeSC4WNdbIVGz2Qk=; b=ncRMs/FxRq70fumZ
	bEH25c6rwXs9WizSy/k0JdP6pwiHYY7dU0XW9FkB1pNfjacWPy8gtsnCvuuWQM1m
	HMwH70Pn8pumdexGMsqF1pbQSf11FbwZ2glxqfGn4cmK8OtRBcXN9d5xFXUZgtY0
	P0oswngXpWAhhleN4xae/RgjEPgjhWWVWHYA5DO6Tc73fsjXZD8muhD9fjC6K1hg
	9PGm3xbvZZFaWmV2nlIBNcMgILDY9MDUArKXwYRC3no2++apvdhGm/WgJ2j4ybeE
	3ncz0MbOndqoFFRM7nIzpJjoyPdnzu4t34nVjilrbruJntK6rHLW2qSxXHTT4Z2m
	pRamYQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j310f9y2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 17:28:39 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9212d968d19so38198856d6.3
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 09:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795282119; x=1795886919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/2ub0vL3CaIDBF+BZvv9xMGDewjeSC4WNdbIVGz2Qk=;
        b=M2pzVLDoKWn4UjdY+zZzDKAK7iIdciKonagGMToU14jvF4G3bf4RAlazO6VVrF9QRs
         9sYL3pEi6v3avZ9HQSk2qmKdb/Cq/R9VeMURD8YbaVwA2sGfJR5uT20Ep8e4NrvItaRP
         C2zApUFseXvrg2RIf9RUtiNqapXd/OiwVyhRPt66jo6fQYxFBQBuTPMKGl1jxmBZsxdC
         SUxXNUAzuBZcv/YpJvkI8HXVjGq7RkwG4CiHQKFDWPf38SM/Kpx6eTgrs+I1IMVIbF+p
         5h92PE4kODIKmkVQ5T8W7uBNWbS4Kcokt2PGBZ35q/Zpr3s8hz+yg7thgBu/jdS9usaM
         WtSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795282119; x=1795886919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s/2ub0vL3CaIDBF+BZvv9xMGDewjeSC4WNdbIVGz2Qk=;
        b=fqes4hhBbKZk6Qn6HNsGrEUvVRop9rZmEmcxyoda78mbfqa65i3wIm3aGBVxq8Pjzd
         DVzpJWBcOCEp93Q2le6oPoTnGoCmbUh8NDwxDlFKxnkChwR8BUbLbvbgoppd+pKzhcqg
         Cg2wlCAvLQpT8mPxg6i1H1CuN3xNmY1sWOrOOlx3JfhxtQoBqiThsT+RvRqYgpYweCL4
         YO98QQXObkvR4s2MeJeBX39Fm+wyagg0Gyke6NKBHNAfJ+wlDrshbXCy6qdL4KMqv/b+
         EmDUBUAxb4UjJPslrQaZqTyB2ZeLqOWcwQH3OvBAVIiOwi9v6TRVE5rMiZ2xn7unKafM
         sQyg==
X-Gm-Message-State: APuU4Z83zvUbClYBvzrRqhB79RVwfBAvBJhG65k563402/Hi3hNtkkyP
	tQKmxqpVDRfNQHlK7J0w/uehn76s7J6dORSdnodTw12oMu+wO7cO0HelpDc2x6H53tkJgCjpmU5
	kXbRr+IUzQnBh08VqImuC/iToq/6tVOgWEFMfdY3xhxnFnnOIcOfyPYVagN0=
X-Gm-Gg: AZFdTZe2jD1XsLVUShGoynwxWl5l3wxFLNBdAEEu1fF3pLPBnyQA8u/iT5Vt4U3nC+k
	lsYY019hHLDmpsn4fHlGw0+VID7cxTHCKv3Yhb0p4eTzFUaeLdVQwWHqfznLcl2Ho3S/0bv3bUr
	cUmeMGlY8z4RhIJrFO9kQvKZygzgu5h/KQJ7RpB4kbPvkb4nrOhQkb9GfRpcuaIq57Stbo43jo0
	6ypt/6Xpwlll6wFpk3WGDuh/foYOXrZgQ1oAPkItthU+Rfp108Zh4GHha9VqTg20tJ/1dX3akzO
	75yuAFbGOS5Wh5rfA+SewtgqsL98zcSR2v4erJh5OgVYxJd51e2f08BCMD95dk3RvRaMec2lW6i
	fgdfowh3eIv+AD2PWWlWhi9Mmikz0Y51f6Q1dJMPijcnSoVxfNOmBgJ+SMk2YXbAK93WcjbB7I5
	KGEhutUG5OpcF8BB8FEEMQWr4Gpc8=
X-Received: by 2002:a05:620a:40c1:b0:949:5708:3cb1 with SMTP id af79cd13be357-949ba67d397mr1120420285a.0.1795282118922;
        Sat, 21 Nov 2026 09:28:38 -0800 (PST)
X-Received: by 2002:a05:620a:40c1:b0:949:5708:3cb1 with SMTP id af79cd13be357-949ba67d397mr1120416885a.0.1795282118477;
        Sat, 21 Nov 2026 09:28:38 -0800 (PST)
Received: from localhost (net-188-152-73-83.cust.dsl.teletu.it. [188.152.73.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm12146461f8f.41.2026.11.21.09.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:28:37 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Sat, 21 Nov 2026 18:28:14 +0100
Subject: [PATCH net-next v12 3/4] net: xdp: add __xdp_return_buff() helper
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
Message-Id: <20261121-stmmac-rx-mb-v12-3-3ae2f3bce174@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDA2OSBTYWx0ZWRfX9hrhJk3Qz1hs
 Hz1Lt/IHpTHOzB9e99H46tapp2bEZlYCqXiTNsSyGNqHNhrIFXdV4UXp1yYj3NYBbv9oVfeCodk
 VEWLmP2uqb2BSP4aO2am3KblY+pdUk0c86xFTq6e5Thx7iYPcibY4EbAVad+mP1hcENn5ywNllA
 UKiLLE/8tpWJo9wA/LP8OS5eNVwuzgqpz+DMgefHlk31sWewGEAsdKaMgeY9o2slH7SulDMF4Ec
 mxW/c0VI4Q7hFZi3LoUp7GvH+o6BY/r8QFPTKHY4TtW9OfWTcd5KZVE1vdMm4OncuNJQmhR/NiM
 6GYxx5TT59v1oGVvWSnBXDTJJpw66IOkGr0lD/b3epMB8r1kb1MkapdtxuIAxlGY621S3RZz7IW
 77RqPgonVAqhlmlsgvYcliYC+NfxEzdEAkJPStWMRi/yeK4FtXMQbFKUQL24/BIuXiulNYdOuCm
 H5+4+BLL1NjANXT0vvA==
X-Proofpoint-ORIG-GUID: DQuSiz8CHo4HU8xfNx09lKkmBIWzWyA_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDA2OSBTYWx0ZWRfX2l4pWWGDcQ44
 EfwgBJ+C3dFeCRU4CX7wZDzAOhLqV9Jvo5EnXpYzsOPvK/mxBE6VpEVq9jR73DjkPpF64OGb2zK
 fJ7OwnVM6ZQxwp+RZStllTwBUT2G6hU=
X-Proofpoint-GUID: DQuSiz8CHo4HU8xfNx09lKkmBIWzWyA_
X-Authority-Analysis: v=2.4 cv=UN1Ijyfy c=1 sm=1 tr=0 ts=6b01d4c8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=EPvaxb3vtNQ3FCvCQEgA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611210069

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

