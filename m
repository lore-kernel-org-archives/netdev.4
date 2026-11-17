Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920341;
	b=eWXzt3SgComOUYBcS1LXtWWQMEHrHdFobemovEjbn6nVWmOMkYJLBPPhD0ft7NRa7KqN
	 BeTBKozrQUTQjFDT+b0fuATMlHn90iDoEZP5qbpl3Y2uQU7mFQw5Q0gKSAQnauNRZHcti
	 EqykLBpOJB6fuaJN3rLRqbN4/FoJJUXi0ZYacMQydq1Gkn26U+Ha/IjzJjuXdDkBGczIx
	 Yr9Mk2ECCXJiB2oB+dYUia/CMaOeiqp674WGm2Ix3+9uscTXyzzlNJNRdXL60ddGjw05Z
	 oBorNUbTCuEvaGQxnWnJcPRv38cxtHGvRvJD020hjZNxlhyTNyPbvzADsOzRJ4Box7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920341;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VSSSORsiisY1CsQn0K2p7M1sRt5FkQmSwTkw4vbiEU4=;
	b=5VeffTzFADehxRQr2zTm2qiDHMu1UKCX4osuQ/5X7uyVzZTXpzmfLMLldFNGBQE5qCs/
	 +E56Ab/hs3p67Z3jX3n1ifkpm/9m4CAgWLmzXc873uavkkLFSA+xOXjLqnz4O3NhSuqTy
	 BQ/ixTiFO1zd7PJvy7831bc4zNWLwViVd/YFcbkQxWaSpTyxaTXu79jqPX2yfB+1hOeGE
	 0NEDBeMGUkpCoMstlKtpJqHy3GCUNDf0Y9zgFytT8Vm9dfC/RDgWuZhVbGACbxCH/ZCyw
	 0UgXOqomlLteDMex5D776NmdwyQg/+fEQcdlOxUAX67weTw1SOuGYWVuB31DMOx6PWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=avF3v8DL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PXEl4kQz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F1F606A330
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 12:59:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59F1F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=avF3v8DL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PXEl4kQz
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC17F9081976
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 12:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VSSSORsiisY1CsQn0K2p7M1sRt5FkQmSwTkw4vbiEU4=; b=avF3v8DLBqGJvYX/
	uU7FsXtWNt0U3g/5JFdi55GUi71jd/cDQV8ZN4WdSm43bEG53AvSu4G/sndntDF/
	JlGAoYu44a9EiaI51VFCxNwflm7kcHhclwrqPxf0T2EwXIFASRetv9K/FDBXGLT6
	mRXp7W6lKfeFquq0JFgiQiWF8Qtf+SV0+cvW0GWCuo3slcAV7zTNJvdKMLkcHvjh
	g2OeJ1MsAzy02iaU+q3tfgD5pYOrgAJIhuLdF8DOMYTqPivNI3A8uhMov/B0zODP
	9gsdY0vyyL1U2yQCv/4rNa/A2FolYOjFdKuvkt7lMXEj5hE3ujcwEQzWvUAZgFsU
	NXU9Qg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0gfr1rbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 12:58:59 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d2d8e6fe02so3047130137.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 04:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794920338; x=1795525138; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSSSORsiisY1CsQn0K2p7M1sRt5FkQmSwTkw4vbiEU4=;
        b=PXEl4kQzvLqtuYPuhals91jtmMoQqcp8WsP4YcewetbOm5s0aeiDx9LN91sq5o+CTZ
         VnNmQEtnZlvfzUpKVX9KNS52abQyY3ajQzaMSWBtV8anZdTUcO8IbF6ZukMwII8mmtBY
         oqp7KsXnjIUCnKd8mNPkqQDa9IsOrFSMT2I8kb6qCBwOqh2vLTl1wlsAvbz6ijWgy58R
         FiyOBVGLe5ioF7Fq5PgYosUr5yfVw6ORHbJSz2e1o8r+pXpIlZa72zjYXtHcXwvjVpzA
         9qqEobsswOGA16+NiNfWTNCUqnD4xbXoZTfQBu4atvMp0jdta69iGYbCmBzTaI5tJUJf
         ldbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920338; x=1795525138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSSSORsiisY1CsQn0K2p7M1sRt5FkQmSwTkw4vbiEU4=;
        b=PwBKwQ7rNanG7Ohpx/bmDYJooblhN3Z88EMN7r9MY0eO+RRl065kpNAjCqxUse1aL8
         2Eygg2mIuo4HXhbh1Lg6DJ1WmuuGb//VpATxEPwevmiLxLOvUhn67rasbVa/1R9DlOyO
         jLByb8pc68yRPjPaWnw9hCxepK+sLO+g9q4xJaDCpPGX0iLsDcwKzz2Gf/9RxdQOCoWd
         9onG3S9JkQs5ev45m4Dy99LHB+KhI+YYzv53lgFDSDaXSFzLWyhhe6F+zTJ/m6lXC9QQ
         DQHsshl3y9VbH2cRnbw5GfKfB3JzE2sYBq8Pkokosot08oAPYM/YlvoSPfd/8D034oA1
         g3yg==
X-Gm-Message-State: APuU4Z8x5SU0EvFwvxOx9yaek6xsrhncFLs6yiHhjWOVpdTUGHNM/cCg
	T44JyTmb3QfnYB1BP+7Et/tWbR7onWPjVLprN26ixeihPpdCWtDfZAS1P1mMXmhQ8NdLuwgs5+M
	nxN4zQAPIZRvRAnHZ+5BWo40QMyPXsN7EbOPRWdPfC1KN199TVv9sIYAnLz4=
X-Gm-Gg: AYBFou0uGuVbUQ5RM2lY+W+cGMkRKbD6pp/OwsBd0lXt1yrg363Wth5dItuMYdUVTlF
	RdzUfbXAqGkhE4l0TZ5nLmun0f9wD0nmzrdyQNxfQ/sJmjDyLB1VUryCsBjlJRwlO6ZR7SwOhmi
	SV2hWPWpB7meFdPfr7/MxpEgsUYSQ7GohHTk+4iKlAP2fXHwGzyNdQFb2KlYtGcoj+Mz+5y6CVR
	UQ3s79YScFHB59vk8I+5Lrz8APJKRYpjeQHADhD3iNIOz9JOh0T7XPzMpX4K2hAgLsWKn1/pW8X
	n0jxo0D3eU4tEucLjK2kkT2xO9S4G1a7jc619CnOKzWeYxe8Bu5Gu3VP8g1jb8JGZUx0SJmOXpc
	uqhXC1hxxELJl5JkFxxtfI1DZO3FipBtl5efuTMQ9qzLE0nDY1ROdzmdH6zBi+5E=
X-Received: by 2002:a05:6102:5112:b0:7c7:f976:ea9c with SMTP id ada2fe7eead31-7d64d6ca8c4mr5116919137.13.1794920338297;
        Tue, 17 Nov 2026 04:58:58 -0800 (PST)
X-Received: by 2002:a05:6102:5112:b0:7c7:f976:ea9c with SMTP id ada2fe7eead31-7d64d6ca8c4mr5116906137.13.1794920337768;
        Tue, 17 Nov 2026 04:58:57 -0800 (PST)
Received: from localhost ([188.152.73.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571f6a40sm143431965e9.2.2026.11.17.04.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:58:56 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 13:58:28 +0100
Subject: [PATCH net-next v11 2/4] net: xdp: add xdp_buff_shrink_tail()
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
Message-Id: <20261117-stmmac-rx-mb-v11-2-9fa5c34ef245@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=X/rHu2Te c=1 sm=1 tr=0 ts=6afc4f93 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=7V0IxQAAFVITDsu0YkUA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: cuzIjyZhX0lVe7Z0hyT5AQjXwxnGJaMP
X-Proofpoint-ORIG-GUID: cuzIjyZhX0lVe7Z0hyT5AQjXwxnGJaMP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfX0qTTRSqshrsd
 TUosB0lwwHE41ZVdNL2nQ0GNYEDC0D3er+TGJkfQtiM9Lrip2MXgZPwRYRXlJwa1HMlAA2N2n0y
 WiylVZbVi9ctdiIpOw7Bfp0BNdZiXPIg9Sudy2FKEw0JOdsjC8igoWZFHNocki164f98sEpLykS
 Un71rZUkpNtHo+qREPpAXlXcO3ORez06QubFgDyXbt7aBYTjQbMXiAqgpiGkcE0vyKGSiaoBL6b
 TBhKhx2mMpjRVXI9TkvYMFYsAnRYUqBcOzud8yxNc8cO/b/J1qGvB+EYZLxBHiRTAZWKAyyx7BL
 ZCRRGrVrbj9HS9rnitWJj9QFm10twu+x2fu0wyd7vWarTnemp3yxlAusw0CfRhiWd59adUyY4pb
 B75sbV+i5By96R9ud07a29syHfSJwNGgf7sCVYytGXCTv8ikpfyDtg40ka24FdM/2nC/NmCkoGd
 v7hN8WTGsHSaClEuDuA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfX3feWJ/pxRcdG
 k+ou8AcNM/Bc+b8oeWCgE/uqWHpm9wVt68Sg0g61dWLgXZdV+HjTk5xViVNBMxB9Q/IoeCzc9Ci
 12JGafFu58uEJ73oZvgQ+CvkoAV2CCs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170051

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

