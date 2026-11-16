Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841169;
	b=SpO8A1GyeIL3af8oXFtvK7O14BwievhQovNydvNZEcs4VVTbHwqtjlnX/gP6pa7UttnB
	 xJgrtvQxd0xrgrSv/atzwIpmEovPc8bqaoMqqH7ZwNbVUv9PtNbBN1TzfBVOaWe9faKKM
	 iPaY2B0luORoWD5+i/xcFOWCPT1DZ42gyE7GUa4Cp5v/96fhXw+U2ZFjBQIy/jvJekyg1
	 GBaDtyMxTIHPQ9hynEoZXCriA1NizsIQnKMml4RSXxZ+4rdeq3kfgZR386lK2XLbppBiB
	 maD1DKD9fkqZzm1NrWzkj4jucyEi6x8dkTqAqAX6XKJ7vkk/4/lSdR9rcZH/faynUbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841169;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vz4fbcxBlTI7N7eeFtB0R00JNlan+aylxX+yRC9l1j0=;
	b=jKp8qyrJ3tcdGRb25SGxME51Kkn7FzvSJ5VcyUsshZnhPiGR5FvUCh6JlT/smUzpyPPz
	 liUVuIXOm7iYiLG5a9SKtIeHp1lAKMpyuj95hcrF25ZVH4oNqUkMm2fwbZm7j3yzIlkr8
	 aLBwdjKsiANhTGETTTycSYUcK3qS2s7r18wKISDE3bvdttY48vSJ6PeNTe345PpAamOh4
	 pYu6IpFylEtP1s9laKCm+HcnyBpKO96QzH6VEmASvRXj8WpDOwqIRdhc83MXweiEQ1q1Y
	 0Yr0CbVf28v/Gy6cG5Q/QEfzBg8PkVt57Ocoj/HiBy3k0FdfLcXW7Hfz2qnCL7aIjBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bOLB7abM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZYLPIDX8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428A7606A886
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 428A7606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bOLB7abM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZYLPIDX8
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGDrWlN1249381
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vz4fbcxBlTI7N7eeFtB0R00JNlan+aylxX+yRC9l1j0=; b=bOLB7abM4jkAfiKf
	yGiF+Cx5NxsP0yPKDepANS4vsPwZqW0hSOkhqfTAlydmEeeOTeOEIHWXYj/B3NZ1
	7xT4h4Jhv2TX+aW2ZLtXc+G8Q4prBJ2v29xIv+pEXWiVOKkAa11Gy0Q2d6POvW68
	pcvWKiYCyT2wry47Pc9qetrNxT6RHvB3NIb/wvX9vSy4Qg6aIRsnlTrAcXhmqhhX
	+RZm1LEkiVlgBDRABJcHRnJQrXac/8XGrOzMfuiMl/MIdkNqS3jN25IZKcF5pJcO
	pwEtMimM2GvoZTNaInvy58ZD31B7lTDWtBa8Gp3SUMMxgXfGNdV64J8rn48YGFli
	spjZzg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j000g0yr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:59:27 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d2d8e6fe02so2461573137.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 06:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794841166; x=1795445966; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vz4fbcxBlTI7N7eeFtB0R00JNlan+aylxX+yRC9l1j0=;
        b=ZYLPIDX8EioUNa+jjzCWaM4+GqCQkWeYgNnsiIpR6GuovoeMUEgDGhc61wJWWKeRQe
         /dYRB6wE4lPSHjsFEG1CzVLFNk0DgFJnr0jM8hKrOrsULJ+G0i6JC35+TBBY6vsa9QKo
         agNoJwVDh1ZZdLaURkMjyfzw4ZF4+mjzTqioYvZl9ZsHh5tZtHNyxLAinyJ2i45MOh8F
         0TjT9lZrDrId3fFtZgTDYobUtccdCQ04cA+nKVNjSFiH86Fifil3oPZ3SoyQ/P7GJ/qD
         fEFu04T09Tz+vKissZsC31y9vd9qqfvtwV3XRe5QHy5gbWmGM2VyUN2wxG31jdutDZz8
         q9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841166; x=1795445966;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vz4fbcxBlTI7N7eeFtB0R00JNlan+aylxX+yRC9l1j0=;
        b=RyseaGWEde91J98cuQtmY6Rqtc0DvjvRP7g7p0aroyLcK+BEZUSXb/GhH8iL6EaAGt
         lwnNw+LpxwBOTeO2G7FyGE00XF+WSralTqpuraemZxv+2eSqL9rIlMTd+cTeBeNhZwmR
         DoTAoMQpSnHHRXwdUaRkIw0WSN9yxCSvBNoQI46VFeFIAjc53cSR2Ge52RXKhS0WfFsq
         z9EofI7b4bSqLBTYEpTRgboQcEQ+yQ5udcVhQm5Ekz+5NQn35Zugk3OuMULf2C1mku4O
         N88Q/wd+DQ/7QfYNj7BL9a7iS5UtQXFUQwhI9ZGLvnXgS95bh2SIFWv5FwA3KrZ7ogmy
         IGqQ==
X-Forwarded-Encrypted: i=1; AL+hErHzNgEFC+k5z2I0AahZsIOQSEuv5AWWwCVfIg6UQW7VjYcmscbFX+X5g7X8hMGlQeCVQcprG+I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Hw18uXhDd16gTCr94AMNw1nIrLwmbRRqEgPsqmlxcmFS8tQqA
	FOaBO98Y/qBpUG0AKREZKHZB59B6y2h+RDounqshlVXDIeV04NcsLGswwpewmBwi6Tnby/Lijph
	Yc9ddcBy4Yz6/g2q5cxNalPAn5G3Nq6pZs9rj6Jq8YGhyyu4lGV3LMWyGdog=
X-Gm-Gg: AYBFou0y71eUpl/LtCvb5BJrmOtmWceROwpnIYhbi9NDmJDojPb30DB1KgQOVkW+c8D
	LVvIyptcFgR9k9J7Sbio82Kkk3oU88tyjzEqjaCe1iO9vHRjPMNpUY5Hna+Um8JwfrWbn8IyUbk
	6JvDkz63V+/pD8OsfyA3UJ3kW4Bbmhu3zLGUNQLqtCTEdbJUWfkDnDBOvLelABhT18+Ja78ZJvd
	xbAdiIs0luN8ymW9DEE21FcS2tJzxI5jUOKeF5l6FyWda2bj/Om4UKJNWEA6zZMhlFnPo78yhbn
	GEz7qpDrkwpoWcIteU28CMB0ILZHMqobWdP6GaBWiKTXT81uzIY+n/IkgcS6lQIVXRvU51fjhU7
	yxk4XNS83OxybQYfmtswtvChrt2BNunK8qLEHgmnevdnAUnRpXhutShY/4UA10jkIbYHmP9x3hs
	ls19fe/e7Y7D1hzQ==
X-Received: by 2002:a05:6102:6e88:b0:7c2:7a0:ae28 with SMTP id ada2fe7eead31-7d64d874f06mr2604771137.30.1794841166366;
        Mon, 16 Nov 2026 06:59:26 -0800 (PST)
X-Received: by 2002:a05:6102:6e88:b0:7c2:7a0:ae28 with SMTP id ada2fe7eead31-7d64d874f06mr2604763137.30.1794841165909;
        Mon, 16 Nov 2026 06:59:25 -0800 (PST)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571d7e87sm203948115e9.3.2026.11.16.06.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:59:24 -0800 (PST)
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
Subject: Re: [PATCH net-next v6 1/4] net: qrtr: Allow the host QRTR to
 assign a unique node id
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261114-qrtr-multi-ep-v6-1-2eb9885659e2@oss.qualcomm.com>
References: <20261114-qrtr-multi-ep-v6-0-2eb9885659e2@oss.qualcomm.com>
 <20261114-qrtr-multi-ep-v6-1-2eb9885659e2@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 15:59:18 +0100
Message-Id: <179484115880.1191469.6312889000780599157.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794841164; l=2289;
 i=youssef.abdulrahman@oss.qualcomm.com; s=20261110;
 h=from:subject:message-id; bh=tfSyqr/JVICb+gJ8r7i4p9ZH7pgvqyq8dvPpEHT6sQM=;
 b=kD/xci+qoKdonWMirYRCjPRULCCHqoSo3t+/4LvbeHgPxyp3K1S2tDB5PInEh8mC6gkvdMqN/
 gYgFqDd2UsiDqfjgXDQNm4LLbrHrVFLoTUJYNFudBj58U9gOKZBgCZa
X-Developer-Key: i=youssef.abdulrahman@oss.qualcomm.com; a=ed25519;
 pk=JsDnG9UOJiLmu4WZj456fEwZASBHFVClDZ4KZkiVFAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1OSBTYWx0ZWRfX7V4qSntj0tKI
 3A42lxCcPN+0OqCMgXry66dl2domnj4Pf4+jdgemIXaPO3pkiNWJvWzMo1JYc8+e1HNkjTS+qPP
 Xq1JT8Fj8rVG78okU0M9Oh5yVbUjbL4AYI9y7g+9mMe/ks4wsYZbQsOCH2zvqfV7WAZ8zi7AOZ7
 LwJ+xpEHBdTd7OHoK/dmmtq/jcjMLEwTbJf9AhwStJdvGgGj8sKXGZs2u86g80aXNajutSStSmr
 KYuzvkQj5XBTraKPdud3xMFXwdO/A82sIaSRfiG35tF2HADFAiEBYRWUnZFG73eBAaHJdnmh9Tf
 fQaiQPeq4Bi1oPMnAgilQUpx5o5wSOOepmMJrYMwbcro2yWMDMGpROagYkWYXm2FmeEKMnK2Fvw
 aFT8lxOl1GF7OS0TfH6gnOgtE5aQwE2iPtNuCqC42+zRpYnOLLNkZSkIIh/F2UfMLNW0YctZP9w
 2nTio6FPcLeJDaobXAg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1OSBTYWx0ZWRfXzHhLdePw3Ua9
 0THT7zSwh5p90W9jeOchwn7Jdb36cei3/3ZxJ/Ww05XYbZ4VV5BiV5EBWRs5LPHKJql690w1rYD
 XcnwWYuW04gR2ivnNdfFOx9aADxXkIM=
X-Proofpoint-GUID: H4jBn0Ax2_q0k3UFCqGZFAyqJ0lOdS5D
X-Proofpoint-ORIG-GUID: H4jBn0Ax2_q0k3UFCqGZFAyqJ0lOdS5D
X-Authority-Analysis: v=2.4 cv=Vdtir1p9 c=1 sm=1 tr=0 ts=6afb1a4f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-dTT1UR66QJk1rbgP68A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160059

> Currently, QRTR identifies each remote node by the value of the
> 'src_node_id' field in the received packet and uses the node id as the key
> to store the node to the internal 'qrtr_nodes' radix tree.
> 
> But this approach comes with a limitation. When more than one remote node
> share the same id, then QRTR can only add the first node to the radix tree
> and has to drop the successive nodes with the same node id as the 'key' in
> radix tree has to be unique. This prevents connecting identical Qcom PCIe
> WLAN devices to a single host at the same time.
> 
> To fix this limitation, allow the host QRTR to use the node id (nid)
> received from the endpoint driver during qrtr_endpoint_register() as the
> unique node id and use it as the 'key' for the internal radix tree. Also,
> store the received 'src_id' in a new 'qrtr_node->ep_nid' field and replace
> the 'ep_nid' with the unique 'nid' in the QRTR control packets if both
> differ i.e., an endpoint driver has passed a unique 'nid' during
> qrtr_endpoint_register(). To maintain symmetry, replace the 'nid' with the
> 'ep_nid' while sending the packet back to the remote node if both differ.
> 
> A node can also bridge other distant nodes, so the source id of an
> incoming packet is not always the id the endpoint advertises for itself.
> Keep adding such ids to the radix tree as additional keys for the same
> node, as it was done before this change. Otherwise the bridged nodes would
> lose their route and qrtr_sendmsg() would start failing with -ECONNRESET
> for them.
> 
> Currently, all QRTR endpoint drivers pass 'QRTR_EP_NID_AUTO' as the 'nid'
> during qrtr_endpoint_register(). So 'ep_nid' and 'nid' are same and the
> routing behavior is not changed.
> 
> Finally, since qrtr_node_rewrite_ctrl() dereferences the control packet for
> DEL_SERVER and DEL_CLIENT as well, extend the existing length check in
> qrtr_endpoint_post() to cover both types.
> 
> Reviewed-by: Simon Horman <horms@kernel.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Reviewed-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Tested-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

-- 
Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
