Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795282116;
	b=361k7qbfYAvJNirSfLUDcyWq3jeLVHW8MFeyvEp1uAzArvL64p7hbG47cD1+lso6m2Uc
	 QWiz9KDOKtk2WdEuWNfrQRixwz1yP9n2HvI1zOayobnFqwr9I+kBp7lO7HXwNLzlNQXYr
	 vjvOjLslGOOE0GI3f5amnIX7yE2ClBwTwT2J1UZaXsKKJ5LQDeUwpjnx8jAhxwJ22XwYV
	 nz43m8LYpJpQyyDihmaeM9WaY7d3WzaONbKIdtpFszYQ/NPXi2pDRLpW+D2nnuM8wt5K5
	 h7ICVAhYvU0wWRlqJ/puZpJs/zqtMKSXMaFoWnuRy4zaPrkDYxg6iH+l+nxPfdauNAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795282116;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Atpvx34I5zy3w193SbuJM2Y7axw8mjZO4wtWdl2Uqks=;
	b=O1vCQMcWx43kuNi4jc7Yjww4d9E/cIwRAMUvAG9xQRuq3fEEMSx5a9Zma3jndd+OTCm6
	 KVOzrDZbB2ExLgSbMD8jHtfo0yhZTgzCrHIjBos3cVkbQHlorRpFgZRM8O/StIZ6YuQjs
	 7ZDWQOvEdiEA0+eaWXLxp0pXcT3UVQgxYlJnnm7snuIyWBM9pi6NonE/d3dhhaKCY5871
	 a8OlF6pp28PjqIa5ZJiSvlJMrWR2z+tg+jkJGxjYMfTkoaHK4LuHR+oVFXHeKTFJ9SPVQ
	 4N7Hw/lejpk/msFOJbkhR9mlbU8mC09ZvEhWi3AJ/OzCTJPkUIAX6VJT2p5ZpoAm05A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1oeZPA0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="GAcEC/tA";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183B7606A320
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 17:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 183B7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1oeZPA0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GAcEC/tA
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ALFa0wj001036
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 17:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Atpvx34I5zy3w193SbuJM2
	Y7axw8mjZO4wtWdl2Uqks=; b=P1oeZPA0xKGWSh3+uHGn4Fy9q4Wn5Vl6U/BKvx
	WiMjtEhZf2Jfllpsv2pepuNGRkejYJc9OxyprRFsDnWKtxZdVAmRUP9nZg4RckCg
	0XvEvfAt2BjOZ2F2TpwsN3cW9betl2pMQGtyS2MI4vl/5anEwp64wUzvVbjvCZD+
	bjFJWWnNmW3a/O1eXS3XEj4vSIswk3dCcTXZI9ptzONtnQ5eugd4NjwweIZEndtz
	DmZtpmkul6SUOAg28rYJHhYk5PliKndZ/syF6YooWH3vzLAyxINPPiNaNA5uN/aO
	KUlMT0ljMmvaROUSndP7B9DxRY6JcT8jXdg/CcQKblXIjcBw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34ka1fxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 17:28:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-948d83322f6so336160685a.1
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 09:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795282113; x=1795886913; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Atpvx34I5zy3w193SbuJM2Y7axw8mjZO4wtWdl2Uqks=;
        b=GAcEC/tA+DtpZ5v9cYBFF480h6LJuDtVdB+1NCC+xFf0VvrHwPO+oMjexz39y0kSLi
         yzz3VPoN6W15TY0LFRPaREjjd2GHtvBgzPkztmwghoKBFKZC55wV4vwdnjduw+MpucyX
         ioah3XP+xfBrENrL9Fb4XhsW55dvjzGdXCa20sXtT8jCfjZZTaHTVpXl/C3dQu6BMRpP
         4o6MvcX4mZ4pAVT/2rCu+HxGoX6Q6peabagWwoFB1SrMXtVKTm14SOCas28zPEjDD6aA
         2i0RZpCvi2ULToxqs21DCNKGJnQWyUKsNx3oMQYchA2+a4sJ4dDo2KjoBU11D7jhzbT4
         /hqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795282113; x=1795886913;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Atpvx34I5zy3w193SbuJM2Y7axw8mjZO4wtWdl2Uqks=;
        b=h5rULx7OHU+Z/60m0rDtEV3XDS5UZm8II0b5EJYcpT/KJ6gF3WSlf/FZsjOBhEPgeq
         gDRuONUlQ5xFeK34LC2nDdEpfH8SCHEL8+jae3V8FN4QylNKAHEyxqzWQ6I2+KBNxhMj
         sWiAbebykqPZhMAs5gB0bY4LlaG/9UO3bQyRdfYsxlI3EYGXnSvulNmxrw96UObOJQUE
         BA4L0wVNw9gcnDkiHrh5f5Xjw+HnuCC2CVlwpArCKP4mVs7BytsWADOOOIp+pq7jiMpH
         Q3KyxHoFyGPoeMAqwpnlrcCE/vD11y22KVO8mitoYSUOFc2NqZQROShye10xiRLPOhjc
         1XRQ==
X-Gm-Message-State: APuU4Z9tZud8oXRUfNh3psYdhxOCNHSLhtAIKb+MrU4qy7TRqXxn33Ff
	mvXxVlB7S/ChuwuvJFG3iF2nNq3cAO+uK+pLix0Rl4YtMtq5EU43TJI4n+DG4nHi2+veg47iymZ
	YlmoZPW8Zbv9t6TuM2eAinyWJ9sTlELv6M8EuKpRd2DuNvpddysz4jLHmyAw=
X-Gm-Gg: AZFdTZfHStmXUblX9f5ytYf9/pqoK/ubYPqTJmLgorrn5NVgqMYQN1SAteukkYW/Gwo
	0IqdbQX3MgQFhugIBU9s8HdL925IyIQp3w4XGaydhuRLekL2lj5QBDzffPHWSCoNKcbyL5CAuBA
	Ci+LUFYwbfQifsXoMJNvlse+N6aWkk98Vjn2oCnT5hv1pRPFgFEOkoXb9GV1c0G0pl+X7133GLF
	aCJWtCfWqmANgc2rnmDs4XfdJCy5LhD/ZU6Fd/Tc63T5YEvis9vB9RIGEnvC/u50TxD+kA703nd
	VwTJnsBeYiVYHF0HUXH6E2UrWVNYI/aRaDy831xwShImixEnPpbMknm9XjAZVBe9BLWzlzVKTQ0
	ViKBZZAz3OmzwvqC/0TguJo1e5T7MyecUAOmrhcoQl29ee7hgefOkdCy1BnqEjd8=
X-Received: by 2002:a05:620a:458a:b0:949:5872:be1b with SMTP id af79cd13be357-949ba9fcc8fmr1063865085a.39.1795282113062;
        Sat, 21 Nov 2026 09:28:33 -0800 (PST)
X-Received: by 2002:a05:620a:458a:b0:949:5872:be1b with SMTP id af79cd13be357-949ba9fcc8fmr1063859885a.39.1795282112503;
        Sat, 21 Nov 2026 09:28:32 -0800 (PST)
Received: from localhost ([188.152.73.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067846esm70964255e9.4.2026.11.21.09.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:28:31 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH net-next v12 0/4] net: stmmac: introduce XDP rx multi-buff
 support
Date: Sat, 21 Nov 2026 18:28:11 +0100
Message-Id: <20261121-stmmac-rx-mb-v12-0-3ae2f3bce174@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XSS27DIBAG4KtEXpdoZnh31XtUXWAMjaXabm3XS
 hXl7iVetIiEDRKM+IB/uDRLmPuwNM+HSzOHrV/6aUwTpKdD409ufA+s79JCQ0AKLBq2rMPgPJv
 PbGgZKqGsI40iuCZt+ZxD7M+799qMYWVjOK/NW6qc+mWd5p/9oA33+mNyQ4YMWiFRdwKEiy/Ts
 hy/vt2Hn4bhmIbd2ygzCAuDkqGCIRUwRg6qYvA/AwFEYXAGTEJ0qNFFG3zFELmhCkMkI0QnvLN
 aBN5VDJkbtjBkMjw3SQnOITcVQ2UGUmGoZBCRBJkClx4rhs6NMg99y6OjTkMESb72FpMbZW/Nz
 YjSeGhJGmErhv038C5Tm3rrwVpviSsl2oqBkCF3gSCkm3S8A9Eq6VVb6y5iruhSST+V2eik5yJ
 EEvKBcr1efwFY0nK/ZgMAAA==
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDA2OSBTYWx0ZWRfX0q6otV20lqrP
 tuFvKMxq8kU2ETGyuoQAP4U6CgvbYej84Lnlml8f0oZ9SH4MY7ZgDPkCbBYseg3nVajMbJrpe5R
 FjL9JCN96ay5nk+rDmoagBPe8gqhIgv6MJfZZWQW6oTB40SnehfmyElV/nQ728LAtQi9f0euBzc
 7a+Mu9xoqPnc5gKB9hf2uL6tSV27Kqn8Wq2t1zjzHlzWKYVuoOTjj2QWODUsnI2zIof6WKym/Qc
 4FycZNnCHZ6KFX34IILkKkViNbvTyNMypc32qAJ6PCgaAkRStzXACdc4EvktfcDH49vE1fqkqwl
 +bmlMwWNRz666msBp59zPtwVsygyIe26HO3A3mlAOlbeNDvq4kYfPw3kQ22b54B9zk5blqXjFKg
 kNWXl3RecuZMzMcQJTzLoBR1qGcK39s4vi+hGGO6r0PapG9W1dXyEbK4uFXIH6pdnmP/ue+UBl0
 QPQBbp85kdF1b7DAQgQ==
X-Authority-Analysis: v=2.4 cv=RJEmjIi+ c=1 sm=1 tr=0 ts=6b01d4c2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UDig4O-PjbkV-u4TaL0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: L-O6c42vHVD1wLSkx8-6HMD2u8yTaMob
X-Proofpoint-ORIG-GUID: L-O6c42vHVD1wLSkx8-6HMD2u8yTaMob
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDA2OSBTYWx0ZWRfXxC9suq1jp5AK
 EWkqmRtqAIuPNRWZxGZPvXGJrtQDLz3nX+LDQPRPPhsyRs990qdv+KxVZxfbjfr2a9R+5yS5Zwd
 8frVq5iF/V+yW14mrUPjBePQ5FTHtuw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611210069

Rework stmmac_rx() to build the xdp_buff from all the descriptors that make
up a frame, so the XDP program runs on the whole (possibly fragmented)
packet instead of the first buffer only. Fix possible rx_q state leaks
when closing/opening the interface.

---
Changes in v12:
- Rebase on top of net-next main branch.
- Link to v11: https://lore.kernel.org/r/20261117-stmmac-rx-mb-v11-0-9fa5c34ef245@oss.qualcomm.com

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
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 229 ++++++++++------------
 include/net/xdp.h                                 |  39 +++-
 net/core/filter.c                                 |  80 +-------
 net/core/xdp.c                                    | 113 ++++++++++-
 5 files changed, 253 insertions(+), 211 deletions(-)
---
base-commit: d23de0bd0bfd62405e6c80028008838ec140af25
change-id: 20260918-stmmac-rx-mb-16469a2714ea

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

