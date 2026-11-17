Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920337;
	b=1aPdIWoQxNm0AnAt4i5u1g3IKkQ62hLEUpEyLDaoaXSfDJBxf7zBhWz0C8InkVsiWGJz
	 dd2f+3E5FBKB1j4XKruaRaLAP8s85aHRP62tX2yHwrgD/I8LUKgcV7EughhGj2VPtMfGk
	 MEPkxBSoBbsWJAaH04oLWZCDocf5CuSXevqWv26lQuUz/t/Kae0s3Dd82HjT6aIDBP+1U
	 UZpNbKD54XYr5VlmMg0kbdNbSc9t4XTok6C4/o6Wyjn9Yvv2j5RL2WkzH5mnjV9HYmxL4
	 LVz3ECnmii0de+kaXLRdYBjbZH+XYjyQEc1bWUZrXyJGyyPrKJzO5aSpQ/cgswR1+jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920337;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DEAmJc2BKBMJhjgbpTTHRFsGLFfRdAaxjZhuC9y68F8=;
	b=YZ/CMB1FriT3Kf5C6bT4P65QYyeRetnvFLG5U5rcRD0D+urCtBCW8uVuwAtiuM5fh8+s
	 yb5ygv2YP/IluheQWxlBwKmvvGwCe0oZ/8X71BNj7VAyO4cSCrCA+h0vMF0egjB1UuldF
	 vrgkiz99N1ipMkTI+5djxNBefSIrCZznD3ZlzhRZCE7ttspSzV4U9ERUhOX9oS7K1MCKW
	 nI5wFhmdgpoyRyTBSi9m5b0Wp3u/gPl9UcrGyhHKbpIC317T93/ti/rmTlghXbuBPgJ2X
	 S0993QPYdZmVsLIEB/jSKxomPbTNr5P6N3x0CeqiCspHPD4pRgGvteUsIr/7E33FULQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YFcyMzWp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bgcWvI3h;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE371606A883
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 12:58:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE371606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YFcyMzWp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bgcWvI3h
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC1ARO082065
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 12:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DEAmJc2BKBMJhjgbpTTHRF
	sGLFfRdAaxjZhuC9y68F8=; b=YFcyMzWp4lhV3Z/xZxPI3Apu642Ptn83zZ6Y57
	htGLyUD732cvGFKAcz21pea1PRU3bWcmeMUh85cnfC2Tl4C5KFlCVSiPUl0I8PDW
	MXonOHbykPksp6aPE3scE8pu8Z8yUr9ifAHsgd0T5uPOOkrOcYHtVMKcIHjZulzY
	84nE6r/UWeBoTgQiQXuo6w6sRLs/WS0wZ6ckSOlzz/HyFAXWlsT9lPs6KdB4ABe/
	enfaAPER7Q4DqKBHrnSyRiq242RSRLceJnweCBKzlqEEdfKjj7F0X7SoWN2ceWPj
	R1vHRt3x4Gh/fgPuJKc7bRvL1EppzQcOiI98BXq0F47ym5kQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0gfr1rbg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 12:58:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9496ff065bcso322102885a.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 04:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794920335; x=1795525135; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DEAmJc2BKBMJhjgbpTTHRFsGLFfRdAaxjZhuC9y68F8=;
        b=bgcWvI3hJm4tvape/uEut86o29ptWPRBPREHd/GyvU9gg7ohlR5rGbvPwxys6gpzB4
         Gu0egFUP8mqbsM8dUH76awFhNm7ukoH8soyCMgcUnraRDAEbCgpuBEdYu/ct0tT6oYYd
         8V/McLebtmRGUJbpMSEIhGWaz9+UnRAxhwcnXAHKWQvdT+eNZ4EZbOaElbTLjnQ8lr92
         WiF4/+CYPpOTSTk6dliSPa2zCGmXDhrcQBUetM+KDz2sTKT6MR6veCztQPBUctrx7BWX
         jphGg+qse3mEEUMg5BvT/D0YQO1+CfsKsRQyeHcP2Chi/qLMeVRj5L9XBDNDi0KAix7m
         GU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920335; x=1795525135;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DEAmJc2BKBMJhjgbpTTHRFsGLFfRdAaxjZhuC9y68F8=;
        b=e657S9TnWhRCyfHbgWTYyA7E+j6CkOgKkDD1CDTxyrtKNMj0uSTNOZvKl4nGVuFdE+
         C6ylXYAmWGkFN5gjX4dxdR95Y7nrtkpzI2hWHx4CkMqxkh7Gc6egAuo2A7l3IE7uQvTZ
         XmWMqhJmWo+4jh0rwnsK6nbRejevwb55/EbQ6P+D0eG177mkbiN5BoDCJ1JYzKXiR9Kl
         hqfFQsaWt/6lXbZZFEaRAytzywILTl9vDcu6qq1VB7rQXy96QbhOBin85iEHAnQ2IZtl
         3WzOdow5YJJEtdD4Qhe1GS+eOtaA1KWNLZboahGepeX1Q7yZbS4pnQAv9fSvD4HJPym2
         XnSQ==
X-Gm-Message-State: APuU4Z//dl7AyVr2wNhQ74YN5gcv5g0Sr9YbC5jdpVjeoo0WYCa3nHTN
	XNXCmWQ1gywhARdfBjsd2ID0c1jmtPp056SPUeh0c6aQ448Qp6WqybSHEzaF/vlbYaUYRFXSD94
	KCRp2nbAV/KcO46wOGHAW+MwJ6CIDP8pTfzXTXMaP9/i5ZoRlXod+UCbJi4I=
X-Gm-Gg: AYBFou328aVUVq9acoHkF+CvexEcgar2iRVLzbREgVB20oO6NC2enyDhCmXwlAKDHRa
	dZtrchnP3/yCjqeXWW1a7BRhICX6//G15v6B923UFVHbHICInBnKfOyrmqK6TaK+HhJYE48muaL
	n/1fPUsyDHjVoEFV9q104l74CZST3YA/qzqapb0XPKsW9AottxYA+cjHlMKdCsncQ2VdGQ203fz
	qHm2QQYq5eBn5qk0y4InWRMRMzEoMbHl1RqnoMTIuU9K7CZaT8dxaJdVnBJYx3RVusVWjLhUV6T
	KaO4UOv+a4MwOhzC9KlVCtlSKezoXtYk5DlV+OekEW2gNPElaxImgh9KBPYgJG7rZCnVLMw2Itn
	L5r3yW3EGMr+UhDcY80GVO6XyXYpCyc8PbZrc9F2SFDob1U28BGipUD7rHAZSkkO9NP6Lu95hmZ
	5cW6AEbBdl2/VBrnb5LteLixgw5Ho=
X-Received: by 2002:a05:620a:2991:b0:949:6e15:e1d4 with SMTP id af79cd13be357-9496e15eb7cmr1406040885a.56.1794920334749;
        Tue, 17 Nov 2026 04:58:54 -0800 (PST)
X-Received: by 2002:a05:620a:2991:b0:949:6e15:e1d4 with SMTP id af79cd13be357-9496e15eb7cmr1406037085a.56.1794920334227;
        Tue, 17 Nov 2026 04:58:54 -0800 (PST)
Received: from localhost (net-188-152-73-83.cust.dsl.teletu.it. [188.152.73.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a32155283bsm5688237f8f.37.2026.11.17.04.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:58:53 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH net-next v11 0/4] net: stmmac: introduce XDP rx multi-buff
 support
Date: Tue, 17 Nov 2026 13:58:26 +0100
Message-Id: <20261117-stmmac-rx-mb-v11-0-9fa5c34ef245@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XRS27DIBAG4KtErEs0M7y76j2qLjCGxlJtt7Zrp
 Ypy9xIvWouEDRKM+Bj+ubA5Tl2c2fPhwqa4dnM3DnmD+HRg4eSH98i7Nh8wAtLg0PJ56Xsf+HT
 mfcNRS+08GZTRs3zlc4qpO2/eKxviwod4Xthbrpy6eRmnn+2hFbf6Y3JFjhwaqdC0EqRPL+M8H
 7++/UcY+/6Yl81baWcQFgZlQ0dLOmJKAnTFEH8GAsjCEBy4guTRoE8uhooh94YuDJmNmLwM3hk
 ZRVsx1N5whaGyEYTNSvQeha0YemcgFYbOBhEpUDlwFbBimL1R5mFuebTUGkigKNT+YvdGOVt7M
 5KyARpSVrqK4f4NvMvU5dkGcC44ElrLpmIg7JC7QBByJ61oQTZaBd08mu71ev0FYjXVoyADAAA
 =
X-Change-ID: 20260918-stmmac-rx-mb-16469a2714ea
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
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Nicolai Buchwitz <nb@tipi-net.de>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=X/rHu2Te c=1 sm=1 tr=0 ts=6afc4f8f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=u4BqklbH0r9NqUsF4ZAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 7HXk3iGc3VOfG9xStHbCSgN7fMWvY_kN
X-Proofpoint-ORIG-GUID: 7HXk3iGc3VOfG9xStHbCSgN7fMWvY_kN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfXzIHyu1uB6+lC
 zTeGTRMZ1FdRZxwAg5xrejnGhY2iWH3MU/hPTIRDq5G30GW6g4WeOQB+AWZjmwgfZYskan6tZP6
 4ucGajOtTMVcjimCIcEKR0R2oUWh7fp+ENEe88E5W61prznk41gc5HmEITEdZkJM8KDL/RTIuLo
 5A8RmhTPRn+GOX3qfOsI87x9j2kpVVYU3aWhh/fIOyGbyTO7EJxlKDcbnxXujOwRsiReOKB8hgW
 xIO6oM1TUOnnousesxQx9bbPmYl1TG4M//suoh6CJU4BI8UN3ro4L617NUbE0xRlQEzYQKeLABx
 fjSy3Dsv55F2ZQpKO982wxvxEOaFv3bNKIc8vcwQ3UIkgKpvIP3CDlccn5ogY8FaFKnQJ2DTa9/
 1+c9mh2tg12CmpqcTw1gn6jQor6l6m81rr433b5zkItyFEahLz+sLh0VDeDJR/0HpGDyvYIdgpT
 sB4V6bCzx2lYkJwc/wg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfX2S52ZdpOoAiq
 p8zaX4+Wom2Gr9z39nrkTqihvk+paAN5aEvoskiL+X81C3Ad/3qsuhYhyQvMy3cd40TrJITCdRn
 XfFU7wRcRmPdcPWuYmUNeH0LLQGnjQQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170051

Rework stmmac_rx() to build the xdp_buff from all the descriptors that make
up a frame, so the XDP program runs on the whole (possibly fragmented)
packet instead of the first buffer only. Fix possible rx_q state leaks
when closing/opening the interface.

---
Changes in v11:
- Fix kernel-doc for __xdp_build_skb_from_buff().
- Add sanity checks for xdp_buff_shrink_tail().
- Link to v10: https://lore.kernel.org/r/20261112-stmmac-rx-mb-v10-0-d3d04b65c6bc@oss.qualcomm.com

Changes in v10:
- Introduce __xdp_return_buff(), xdp_buff_shrink_tail() and
  __xdp_build_skb_from_buff() helpers.
- Link to v9: https://lore.kernel.org/r/20261106-stmmac-rx-mb-v9-1-c099c923664b@oss.qualcomm.com

Changes in v9:
- Rebase on top of net-next main branch.
- Link to v8: https://lore.kernel.org/r/20261018-stmmac-rx-mb-v8-0-5f58c0b25849@oss.qualcomm.com

Changes in v8:
- Add patch 'net: stmmac: fix VLAN tag stripping on non-linear RX
  frames' to fix sw rx vlan parsing.
- Rebase on top of net-next main branch.
- Link to v7: https://lore.kernel.org/r/20261014-stmmac-rx-mb-v7-0-5d2d70f052cd@oss.qualcomm.com

Changes in v7:
- Take into account the case where buf2_len is not 0 for the single
  descriptor case if the interface is running in xdp mode.
- Report rx_not_ls bit if the packet is splitted over multiple
  descriptors for dwmac100 and dwmac1000 cores.
- Link to v6: https://lore.kernel.org/r/20261012-stmmac-rx-mb-v6-0-2225050915c1@oss.qualcomm.com

Changes in v6:
- Drop patch 'net: stmmac: allow non-linear xdp_buff in XDP mode' since
  it requires some XDP fixes.
- Introduce patch 'net: stmmac: drop split frames on AF_XDP zero-copy
  RX' to always drop XDP multi-buff frames for AF_XDP mode since it not
  yet supported there.
- Introduce patch 'net: stmmac: drop multi-buffer frames in XDP mode' to
  fix pending bugs due to missing XDP multi-buffer support before patch
  'net: stmmac: rework stmmac_rx to support XDP rx multi-buff'
- Link to v5: https://lore.kernel.org/r/20261009-stmmac-rx-mb-v5-0-c38fa4eaa138@oss.qualcomm.com

Changes in v5:
- Fix possible read after bound issue in patch 1/3.
- Do not allow parsing non-linear XDP buffers if the program loaded does
  not support frags.
- Add patch 3/3 to remove MTU constraint for XDP prog.
- Link to v4: https://lore.kernel.org/r/20261006-stmmac-rx-mb-v4-0-efa4ca974e3d@oss.qualcomm.com

Changes in v4:
- Reset in_progress flag when the packet is fully consumed.
- Advetise NETDEV_XDP_ACT_RX_SG capability.
- Link to v3: https://lore.kernel.org/r/20261004-stmmac-rx-mb-v3-0-50fa171af9ec@oss.qualcomm.com

Changes in v3:
- Return secondary page in case of error.
- Introduce stmmac_xdp_shrink_tail() to remove the ethernet FCS.
- Add patch 'net: stmmac: take ownership of saved RX state at poll
  entry' from James.
- Link to v2: https://lore.kernel.org/r/20260921-stmmac-rx-mb-v2-1-6e826e1ff306@oss.qualcomm.com

Changes in v2:
- Rely on xdp_buff_add_frag() to create xdp fragments
- Fix bugs in rx_q state recording
- Fix the corner case where we receive more than MAX_SKB_FRAGS fragments
- Cosmetics
- Link to v1: https://lore.kernel.org/r/20260918-stmmac-rx-mb-v1-1-0b4517d404af@oss.qualcomm.com

---
Lorenzo Bianconi (4):
      net: xdp: add __xdp_build_skb_from_buff() helper
      net: xdp: add xdp_buff_shrink_tail() helper
      net: xdp: add __xdp_return_buff() helper
      net: stmmac: rework stmmac_rx to support XDP rx multi-buff

 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   3 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 231 ++++++++++------------
 include/net/xdp.h                                 |  39 +++-
 net/core/filter.c                                 |  80 +-------
 net/core/xdp.c                                    | 113 ++++++++++-
 5 files changed, 254 insertions(+), 212 deletions(-)
---
base-commit: 500da33276f5d81da764775223de9e9a251a4dbf
change-id: 20260918-stmmac-rx-mb-16469a2714ea

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

