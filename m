Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794995023;
	b=4Eme8YhChLgsYJ3J/GvrHAx7QtOYgitmi/nVZFC9Y/EZ9qzjwkJjLs1kNEBCeqhd2tR9
	 xZ3Zwx1vR3km2XNF0hBd5ZUlh3V7DAMO0V1W8ti599JoOXx8fDoR6UpqRqYKhP8j4rsP9
	 f69GjwB7ntFYIZ/sE1OhqvPc269JocNOnF9e/RMCH/Wawb30qRzUq3bP8VEn9WW8SA1AZ
	 B+5rZiLpP0c3oWczSgvOmbKYnfouKpQ2Fmw4ER6A5tiZT99VW5fWQWRV8OL28P5RQmlzd
	 SlKbgBd46Lf0k7+MKSdFMEDdepHyJWwfAZs+vUoqf5jkCSGPJMTZ2WjqTzmmm3/f9dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995023;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AUnrIqYg5oO/8dWsnNZrU8gC3RoY4sAX8r+6bIRiQzU=;
	b=zgA4Vixj7brvkYBDsCCHkvHyeu4pfv9Z9Qm40ri+F0oYj3lIX6abOAPzA0T5HOmn2FJy
	 uMnM46YM8M7N0n9lCSHzGEl0M4pF+bFhQzWMq8CyArAhph7TIYxbVQansseIlFmG4xAOu
	 8e4rgSr35bFt09mpguYE6/J2X1v7WnIyU91DizzwaRm8/rZVGDlpUVS8FXNXRUhlVuYnb
	 NJMJ0xZHVeRGKNq8SXYYzZsFfTrzdG7UCwu60Lgha+cZeg8m7TOZ53r2qaI4aDazJTI5D
	 WAYNY2jTavL0r7LCnETRjCKc8QiT8WRvybmXlVe91X7mhDu7F1YVrEaQ61fDQ3iOoCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C3AM7ma5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PIw5MLxt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8DA606A320
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 09:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C8DA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C3AM7ma5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PIw5MLxt
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8FKa01430569
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 09:43:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AUnrIqYg5oO/8dWsnNZrU8gC
	3RoY4sAX8r+6bIRiQzU=; b=C3AM7ma5b7fxMT9qvM40GoiEHIniEOXV5+aCbCYH
	wJGk7imQK3QM2W3lWYYtco0s7LmAVfO5LQPJao/v/fHyYigkAR2/KsMwOEoBbFbd
	F68H7vQ73gJLQ65ph7zygPqbPyQq0HW+yuwjvu3LFJyebvK7oMGzAxWOOqs7D1ev
	vS7/nZgpZOL1jLaaZNvXcpNVyPEZTQuonB9Z19hnSRefqK4kZfzUUnzoIeiiA3WH
	v4Ich2uHdHhBjRlaE8nAbjLPKTsY6ECcJLL1hbHEqaMVkT4/M31E9CakIaDynlCH
	wRUUbWkKpMcJqu8uUcBAUqdK9oJkHgs0nHGDvzkYIYO5mA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv92cry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 09:43:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f3969a2a7so118267785a.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 01:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794995021; x=1795599821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AUnrIqYg5oO/8dWsnNZrU8gC3RoY4sAX8r+6bIRiQzU=;
        b=PIw5MLxt5nnUKf+HorXMNmUhdInSiZiRqtc1xJV0OwZ4rHcbSbemHhMUriNPMkexZ8
         9xs3dVzfoeRMsy/61Wx5Pf5vx2Lxrr7h9CoEp7PoGCf0IxuO/tsdoaVTCcgUHRICJGX0
         Uu7jTrqn5AmReCJUmXxa8PqeZNQ9h+P+t2qP1j98pixlwsZ3bL9HZKzZGxOehbMMiKbd
         2qzeEN0PuwLBQir4jQyD+d4FHnrIAaK5eOr0Z4U0bZN8E3kaMXyK+e9AcD/ixVOMul6N
         4deEFg9kqsI0XIM4kTlxYbzG03FTuD9VI8bLMGBvlPEeWQ+QASAKroYYv89ddFO/c8lB
         sVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794995021; x=1795599821;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AUnrIqYg5oO/8dWsnNZrU8gC3RoY4sAX8r+6bIRiQzU=;
        b=RGV4kTfeMFDyH3gmiPZe8y/Z86/dUusCqxYP/F7wZJSvs4rsvOgLbaeA8OST/vOs4n
         0aYJf5Vma2qShpeZHhjgT22hGY/WVgN0pFuWrNo0xEijbLeCYFvuNmFo3DBmzz7V6Iti
         lATC1gzBd/tgfTVka4yMgRI1VBJ9teC/xU1SR4dPr8hf+F98Zmuw/z/ILsN8FQViJVfO
         FpBTkrouAYI9eabagep7w/WITCob69gzF4yOB+6ROnfs54WWBa9hu/Ry7Y4EE7TTrJK5
         VnMjpkv88hj9N4gLwPiGz55Svmmcv3MwnGakp/S2vI1V+v35AvCyrh/lOGoXfrYez7wv
         gQNQ==
X-Forwarded-Encrypted: i=1; AL+hErGtoDwQ4DQV/uhtXcHwZtyOGwC34Du0Wuv6xnA4sQTEGmGMFTeNYk7ZjPKebltaNHqCNWQ2KxI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7pZZMhEgxNlZmaXxzxszfIjNmJ6qr7eTV9k/Fg2VanV+C9+UH
	8HsSmC+gkGD1SxOxmoKsDoWcZpKwVnxjUK3ojOYoTGT0niAsfJ0pX7oPyNELwniF5EVFU3diU4q
	1OhyiuZNsa8IRHUypu611BqsetYVUe8PkN/iMDE/pDl6jZHkG6Vg1q9iB/2E=
X-Gm-Gg: AYBFou3to7pO7MhracfdGd0dl6qRmcbBi6CRCZ5ZjoHsWwAU7u1UHAlWk0cGtpVol/r
	tACbe7eGKJWUFDp3NxJ9uM7iTtkltbK7A8XanjH1aPrtOqZQ+D3Rs+DCmJGCqebhhSo4JqqEa/h
	FigxqaKmNakybm9h8434qMk6V54Jf3sltAJah5g/LAS168t2gLCIFuMveUxdScWUqk3i/6kGhwa
	tLJRAXSH/GZbxVyo0nFteaa9xPyYeU5AARnHm+BfgvyH3EEdRaMUbG7fmxM8YlPWyWYhF6SU9xE
	Q16AleM+rVicm7wjaBLBBoHIQk5hKBNnyVG/SdY1NTVxjR6BbBC+HLJu61QinQVNj0cu3ao+IVe
	ny/yuuIDNN3bUnD/UgskvNEQRs66ZQwsH9XwiGOXkrPb7bkWUXhYtIo3uF+jadzI=
X-Received: by 2002:a05:620a:178d:b0:949:3066:5569 with SMTP id af79cd13be357-949995b2d4amr398314985a.46.1794995020972;
        Wed, 18 Nov 2026 01:43:40 -0800 (PST)
X-Received: by 2002:a05:620a:178d:b0:949:3066:5569 with SMTP id af79cd13be357-949995b2d4amr398308985a.46.1794995020335;
        Wed, 18 Nov 2026 01:43:40 -0800 (PST)
Received: from localhost ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656095e98sm3435347f8f.42.2026.11.18.01.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:43:39 -0800 (PST)
Date: Wed, 18 Nov 2026 10:43:38 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v4 09/10] net: stmmac: qcom-ethqos: add Shikra
 EMAC support
Message-ID: <av1zSpwvTVWP-2zZ@lore-qca>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
 <20261117-shikra_ethernet-v4-9-c41902e5f2fa@oss.qualcomm.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ETxtsn8fYdG6F01d"
Content-Disposition: inline
In-Reply-To: <20261117-shikra_ethernet-v4-9-c41902e5f2fa@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfXyrUKv0O6dB9k
 j+rWAazhaUzqTd8CNbDIqSY0ezr1a6Ddvtn9cTpZkBEFBOyM4D2Pw7WQ50BHhuj8gG6v2Y/xHTk
 GhrqYAx4lTKncgHOVU9cOQe5VpzFYoISMegpW1TA0P3hW8rUeO2r9qZZlmVPWka/yZ9YdT1LGpw
 +3fHUdFfU3aL8/JFUL8fmQTL1k0OlwC85CqohA2dh4ZGJrL7mJxNBYEeVQGJlMbnjAsKZVCtF0G
 jfG6KGPcP0j0PIFdNbdggEfD94SdLsuBcwfePHmzy/uoDrlg1dv680lv+stpsbmHiGQ8HPSzuuF
 5sl1nryUJdu3a+gnqo2Ee0GMszdxPVrpbVFLdN43qQNFjd41OMe5g/u7iETXc0zYGv2a4JvPIJ5
 jsDw5A05ygBlJDqnmqNMYUgiYvJRYYuZxRGa3DQUunG1BEZi9ouBBBzVjFcFf0JaZtN3J1AHAKN
 eXgO3u1AA7aQOnE80nQ==
X-Proofpoint-GUID: VCyrOvEvCCQTWLrWuTW0SQUVZ70luWO9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX0IbRhgerE/MO
 UWbzl5eCPdocnGuItWhqfJj7WrRnihztCN4p+Ixg8h4E+x2yz4xyMbty9XZ5W8kgVxUrM7LC7Z8
 kScsMjHZ96HrfVH5F7uTNOvHVZ2Zbt8=
X-Authority-Analysis: v=2.4 cv=LuQHWXdc c=1 sm=1 tr=0 ts=6afd734e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=LGXQo2T9AS_8CfUs2oAA:9 a=CjuIK1q_8ugA:10 a=AOVp3MrtItf36BpiwHAA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: VCyrOvEvCCQTWLrWuTW0SQUVZ70luWO9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180038

--ETxtsn8fYdG6F01d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 17, Mohd Ayaan Anwar wrote:
> Shikra integrates two Qualcomm ETHQOS controllers based on the Synopsys
> GMAC IP, similar to previous platforms. Register qcom,shikra-ethqos
> backed by a new shikra_data descriptor that enables the three NOC clocks
> required for DMA memory access (stmmaceth, axi-noc, pcie-tile-axi-noc),
> and the 36-bit DMA address width.
>=20
> Set the NOC clock rates through an OPP table to ensure proper voting of
> the VDD_CX power domain. The stmmac core enables stmmaceth before the
> glue driver applies the OPP vote, both at probe and on resume. This is
> safe because VDD_CX only needs to be voted while DMA traffic is
> ongoing, which cannot start until the glue driver applies the vote.
>=20
> Shikra's intended rgmii-id configuration supplies both TX and RX delays
> in the PHY. Therefore, enable phy_managed_delays to select the
> DLL-bypass sequence. No POR table is needed for this intended bypass
> operation.
>=20
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---
> v4: set phy_managed_delays to true for Shikra and reworded the commit
> message to clarify concerns raised by Sashiko.
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 19 +++++++++++++=
++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 15385750b3e6..a7fdba73da2b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -332,6 +332,24 @@ static const struct ethqos_emac_driver_data emac_v4_=
0_0_scmi_data =3D {
>  	.setup =3D ethqos_scmi_setup,
>  };
> =20
> +static const char * const shikra_noc_clk_names[] =3D {
> +	"stmmaceth",
> +	"axi-noc",
> +	"pcie-tile-axi-noc",
> +	NULL,

do you really need it?

Regards,
Lorenzo

> +};
> +
> +static const struct ethqos_emac_driver_data shikra_data =3D {
> +	.dma_addr_width =3D 36,
> +	.has_emac_ge_3 =3D true,
> +	.noc_clk_names =3D shikra_noc_clk_names,
> +	.num_noc_clks =3D ARRAY_SIZE(shikra_noc_clk_names) - 1,
> +	.rgmii_config_loopback_en =3D false,
> +	.phy_managed_delays =3D true,
> +	.dwmac4_addrs =3D &ethqos_dwmac4_addrs,
> +	.setup =3D ethqos_hlos_setup,
> +};
> +
>  static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
>  {
>  	struct device *dev =3D &ethqos->pdev->dev;
> @@ -1101,6 +1119,7 @@ static const struct of_device_id qcom_ethqos_match[=
] =3D {
>  	{ .compatible =3D "qcom,sa8255p-ethqos", .data =3D &emac_v4_0_0_scmi_da=
ta},
>  	{ .compatible =3D "qcom,sa8775p-ethqos", .data =3D &emac_v4_0_0_data},
>  	{ .compatible =3D "qcom,sc8280xp-ethqos", .data =3D &emac_v3_0_0_data},
> +	{ .compatible =3D "qcom,shikra-ethqos", .data =3D &shikra_data},
>  	{ .compatible =3D "qcom,sm8150-ethqos", .data =3D &emac_v2_1_0_data},
>  	{ }
>  };
>=20
> --=20
> 2.34.1
>=20

--ETxtsn8fYdG6F01d
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCav1zSgAKCRA6cBh0uS2t
rPbRAP9BOltPilAtM/l/jP103hZDb2bBRLwQa1hr5OhxYjxr7QD/e4//9SJ8S8YW
RN03Uozs6Lfhs9Mz/3nOHiTwyhZ/zQ0=
=rI6r
-----END PGP SIGNATURE-----

--ETxtsn8fYdG6F01d--
