Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618157;
	b=lbfQu+YkI3Dp7L98VyRk+Jv/bZWXQO4VgmYJ2/NjpCcSwgkn+sQ73iFVBn2qcJry2Gwc
	 o7sVATWODUU3V3sdjVfjJcZQvgQc0M6N0zRdhgF72SZg8Uyr7f0m4EB08uaDH4+UOZHAv
	 3D3D5VG3n6muHbbjVtGzXP0lg3lo9+isWBtFM2g7SGBY2he7YSEqRAueii/+Jlg6CfZKK
	 bs80OSkjCk/LhlVaiEd8eq6EqfxYgp/ovGqbtTLXCkGwwVHnwCGLviT56YJTghk/gMqp9
	 M7jSNMbWYTa55WiYf0Huf+2fZ9RRYc3YLRVIz2qRX5Xp9YKry+AMFniC1qc9XdR6IWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618157;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lhO3ie7MyS5IbnfBQG50mZt1o4BzJsfDN7FBCdEFYtk=;
	b=tHP9k20YaSJfncCGyJ/LY3awodTTcGB11WwI+jDpLvUBTxqZl0cUXBi3ztkk1U83y82q
	 HxEwCLUwNK9JAqNIXbUwzr0MKVrrBrCgpAbSCUTsXY8AE6gb4Vrz74DlycC6YoqA8Sfol
	 VMhxHyIVRWTOSLK8cov+L7xqMBc97xc4PQrVZh1YBhUVGoXgFYGNvS1qdLzP2yVES9T8Z
	 AMEXynsI+m5r2JfR8a+4InSB3au7YWyVNbPMJdmLqJtCtZHzamVzwgQwCIST4EsEZnbn3
	 2KzgfW3oC85ydkeruMn+YcPdK7aMxfeVmjjf9BGsPEXlfvkCD3O+tazbpi/Dlcm4+wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nT9gDU7v;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iYzEgT2d;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D417606A333
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D417606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nT9gDU7v;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iYzEgT2d
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APELroG016207
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lhO3ie7MyS5IbnfBQG50mZt1o4BzJsfDN7FBCdEFYtk=; b=nT9gDU7v3b4nEnwQ
	60VdfNWNP0dwEZAqTDdRsJWxlvNWTzWUmQIo3l5bOP0Mw2jAUKareZHJQTYiX1CU
	GMuhqKiDVf3+11InQvAHWmaTRTHoNnrTlCvJ6Bec+beMuH/r7wqmpN2fxjLHjQjw
	lVd28uqhFVcDoKoBQl2X5sgzwRqWhryMjDpj8uMq4nTckT7k8CjtCi3Onkj2AjZZ
	hS2OhgK1qVJtRLuvXiEMT+3Jh/lUjJvhB/uWvpdnyOOylrtbLcFyIxfWYHfQ1LrZ
	ymmQVhmVZ9Cg2lk2gU76rehehgi+BrjX5OwxYN8nbCNXQsDXWVGtv/3f505DVWFt
	NAi/bQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahr43t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:49:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2373e9b4so662325185a.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 06:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795618155; x=1796222955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lhO3ie7MyS5IbnfBQG50mZt1o4BzJsfDN7FBCdEFYtk=;
        b=iYzEgT2dQNieC/UwLpiBgZEZqZiDjcaxv+qmQ46qtSlP+U8KpSLrd+FsTPoioPJXfi
         RiPV57FRZANlMo/MUSn+VUuiJLdiqYbC3/Rc3/wCYU+H+qSNvz8Q1+COk4qNowdGiUBL
         ab1EjCloDWgRax1xOfRC7DoZZNVhP3jVyd2FvjYnPJTrPOqolam7psV4pJYKimUiin2Q
         WS1v2udszTaQ/BzN69AZO/mZR9/So1LBmAji8Zb+ZLrQzjKzaHSPEpi/K73EN4lspyBm
         IwromQU9PP47ASknQR8Xcyfatr7IOKzHzV+a0rbyvIsZQ++e7uzq2T/bXDNCid+Blf/b
         isPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618155; x=1796222955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lhO3ie7MyS5IbnfBQG50mZt1o4BzJsfDN7FBCdEFYtk=;
        b=fwfFaKjtgKQoysIPOKYe/LQKDd4UvSOXM1ltJQQ+U6CyioqoYHytGdhd01jhWAFB9e
         2HOo2c5C8TYmGYRvYz5cLBTYl57Zvx3pmO20VfcGxb8YXDKDAb5BLWJlSq7MQJu6jgt/
         Vs72KSHnG2OwWokISa0MfLWZ5nDjpI75P4JktBP6QQg1MjJBagoGkRnI1q3ivFnjNeLK
         A/gUKtVlZryi/SORX0MSiXt2TpTSnowcfEpMU6r89eQS5I4tUTSQhKcwopnW4ykUI7vq
         pur9zmytR46+CU6M6zfURL+llOTTY1SwxxE9KVJn+vZBYOUe8x02EwU2dCYVHfX/+Hef
         mbUw==
X-Gm-Message-State: APuU4Z/cLTvFEVe8wvmANr5ygfH1HEY6QIBYRXBX9aiqsa2CIPFtsF8z
	WAzHV9ZfZiubbYwBcgL73oB2vvcEGFF0OP2aKLYDdWuaM91Mo3vvWcz0UiW3vmIK7LpxNsNHSUx
	QZLZOMdkRk83xbof5jZnl7sJbp3FX4ufaxIk/NG3VnJ3a4zwHvgNCmKRJxUg=
X-Gm-Gg: AZFdTZfDTFj+NVJ8GLE5tWEXlophJ98kJ4j44m0XFcqtkL2raMG5cJNegSZKhLx1OMQ
	TkhOPpZ2aFgfeWna4BJ6in0vz9XNMcRRcMP95t/F9FpjLtcfK1cY5sIHnxcQRC6w8xegPeUFqvA
	XcORe4KJ9ZjXh0okK6niKXDEO1yD0H28tj0WdnNczpx2pdURcHGtdhOUJm8zCUejfrmsgFAxaQa
	IKLYTyCeKO3T92JmObbJHZBZz87aWOkCHq1m/3H+ptaSz6adoUL8nc1d5hoVplfjbsERrjNPExf
	yYWgOhuDsWtzQhMyMzqJQRtmuAtj22goFmOS4KzyTjDgcHzfTNFKpAHEB+iSrC4fP/8D+aaK1+q
	EyFIB6BIlU6RUVET13JedxRCLqIiaGNy87id+MNHW3zMOR9VSEodomeBOksLMBknLvCuJ9xBE+e
	4Txp0c0J88JQyS3h9i6x7oGCS/y/A=
X-Received: by 2002:a05:620a:31aa:b0:949:3066:5551 with SMTP id af79cd13be357-949bac80948mr3198570885a.79.1795618155148;
        Wed, 25 Nov 2026 06:49:15 -0800 (PST)
X-Received: by 2002:a05:620a:31aa:b0:949:3066:5551 with SMTP id af79cd13be357-949bac80948mr3198561785a.79.1795618154494;
        Wed, 25 Nov 2026 06:49:14 -0800 (PST)
Received: from localhost (net-188-152-73-83.cust.dsl.teletu.it. [188.152.73.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm523493195e9.15.2026.11.25.06.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:49:13 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 15:48:46 +0100
Subject: [PATCH net-next v13 1/5] net: stmmac: selftests: Prevent RXC from
 being disabled in LPI
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
Message-Id: <20261125-stmmac-rx-mb-v13-1-0f6bac53e8d5@oss.qualcomm.com>
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
        bpf@vger.kernel.org, Peilin He <he.peilin@zte.com.cn>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: umbsbJ31FInIdyE27_XhZOm7Hvxp1dee
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1OCBTYWx0ZWRfX/KRRcTiGCzcj
 CLAKcSuW172wXNVQhiXpZxJ89G42Owe3GzZZpMha8LVpxxa+XOcjh3FdTqm/2AnR5UOLEKwD1cE
 v4EUwYw66SKdBVmysIKwxHnG+v7Jsmc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1OCBTYWx0ZWRfX6rCFavS7XxxI
 JBWgYCC569m+exR7jCban/2D6DS6imcGn4ZXhytZ2laeMltn5o5Yc4z5fsrdRBETX37RFZKH3+9
 vWDqm5IaXgY3W0W+v08WqBkosWF8urG7bk3URBtkmI0xOq1w4hq3tbfKdJDjUMnPLmBkK9zOtyV
 h+P2HZ1u5cCvSqg3Wussq+fe06C26sqHITMXAPYQfDkOzcNY1OJBFMqwQOUHtLFXczxIxMfkJ4y
 ZKn4B7gyMr9Br12piqN69ekMxzIwtW2Qr5VOH5sgoCUaDUddRBxGTANYe9WtUau1Pv1hxk0h1ag
 Rmaf5EYeQ0wvV62CLq0+/MpOStKH/7mQZm/kwD/xokL9PQy2G1bV5oioW3j/YkizGZ/zU93OamB
 LITFLkUs4l7yrnYy5+IUjxJe1ErLkvns8O5vnNN4/dKmYtMdGPL0liSXXh1g1cPF1djC1GU4LXH
 l27aC/wihQvUhJP6W8Q==
X-Proofpoint-ORIG-GUID: umbsbJ31FInIdyE27_XhZOm7Hvxp1dee
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b06f56c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=P-IC7800AAAA:8 a=1RTuLK3dAAAA:8 a=6E56evKkPzl37l_feFUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=d3PnA9EDa4IxuAV0gXij:22 a=kRpfLKi8w9umh8uBmg1i:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250058

From: Maxime Chevallier <maxime.chevallier@bootlin.com>

RXC is critical to the RX path and some register banks in stmmac, so
it is blocked from being disabled in LPI when we know we're going
to need that clock.

During selftests, we're in MAC loopback so the PHY may enter LPI and
stop its RXC. This will prevent the RX path from properly receiving
the looped-back packets, hence failing the selftests.

As NETIF_F_VLAN_FEATURES may be empty on some platforms once the
software VLAN stripping is removed, the phylink config attribute
'eee_rx_clk_stop_enable' may no longer be unconditionally set to
false, hence allowing RXC to be disabled during LPI on platforms
that don't have any VLAN features. This is already the case for
CONFIG_VLAN_8021Q=n builds.

Fixes: 091810dbded9 ("net: stmmac: Introduce selftests support")
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Peilin He <he.peilin@zte.com.cn>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
index df696e2c1528..41a8493cf9dd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
@@ -1940,12 +1940,14 @@ void stmmac_selftest_run(struct net_device *dev,
 		return;
 	}
 
+	phylink_rx_clk_stop_block(priv->phylink);
 	for (i = 0; i < count; i++) {
 		ret = stmmac_selftests[i].fn(priv);
 		if (ret && (ret != -EOPNOTSUPP))
 			etest->flags |= ETH_TEST_FL_FAILED;
 		buf[i] = ret;
 	}
+	phylink_rx_clk_stop_unblock(priv->phylink);
 
 	stmmac_set_mac_loopback(priv, priv->ioaddr, false);
 }

-- 
2.56.1

