Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795281613;
	b=mEchdWdPoBCRlQ/hTR9keU5U9pmEwSYIwKaWL/IKYbsS+QIzH8Qi+Xs9831UBmIb5Lt7
	 LXloqPetduP0ugpklO0kHZNVFuJ1dl82ArXYQONJKl9OheTJzuENLw+PxSO5k+2vA/LMp
	 ZE93KKfDDEvO0pNFbrLQ/GrKiCdJzKfSnng+3PM8vgkzwFT1wI9PZLAFjEG8+srADZ1Fu
	 zFNuHL/r2WVeRvepbvbYhUnm8D5dXLJLitbDLLP8cFFgMumZbMuuNb7NiNIM4ekqAV9ma
	 +j6jLl0B++kVE/vzaH50m9ufOeqmaNWPydmcRkTcJM8/DVdyMKRqbZ7Nz1AUpMJw+sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795281613;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EToEzVRVg3WYCmb+Ipge3agclXFYn4/uigqheoHGHhY=;
	b=F+UMkgAM/HWTNVUYstfPcCMqrDVh9tALRaij0KA3o6WJWOoo1Q8imsiS7it/ny17QlRO
	 SdqAcV2pK4cJ6Qd3r6zcbL9bryUmTPo38ngg4N67j6qkHx70l5EsVbUxdrnmmxKI22MBy
	 813ZZAnb/eOlPHdbhA5W8zwItRMfYlxVP8l7z97pwc+YqbfaPQ4ZGCpVrqaCUMTtkASQt
	 7xiXNC1iI+6hrhcjud54Pzh2S7cSs7Lwzj/O5J9zqmat4peB7sz54uCYll3rBdtNBdbv0
	 GT3fYdVpwuWPYQSgjMbRg15nanLiXgde4Wiq/crx/NPdImb+HYWc4OJzc3r661pdy/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R8lt9rnr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LD4zR4Y1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A076606A32C
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 17:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A076606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R8lt9rnr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LD4zR4Y1
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ALFaEMZ461671
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 17:20:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EToEzVRVg3WYCmb+Ipge3agc
	lXFYn4/uigqheoHGHhY=; b=R8lt9rnrMWNv8jRFcGdODknQ8oy6XvTiXjgNUJ4i
	MY0tL51IWIQSKGFMyh76tvqZ/VEnj4o7AlCUBzcu+e39rxqb3RZX1AydZa4XVoxq
	qEHSLJ6DLo1x0zjxDhoQ6BE9s6ym+c1BumtOPR5+hKQ4kC1FYE6mtJ9oejhGR4Uh
	dzJEoVNuZ5OYYXvDhmBJw5qLGT7yann9TeKKEPJmLfPT2KW1DSIvGi8/V2Dk/F4Z
	M7gNyrEC1FqUaJbQHELKQVobW28PZUNlYrq4SiK0Vd0Xsw53cwxLyOB87nVVw51k
	UunvQxWqJ5WXm5hL+BqMogsB2UsUtqZGomMfFGALtBR90g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j342ghg55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 17:20:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2005ce21so330856185a.3
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 09:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795281611; x=1795886411; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EToEzVRVg3WYCmb+Ipge3agclXFYn4/uigqheoHGHhY=;
        b=LD4zR4Y1gbaDQ75fVGtwJy2sv2y+HM2Wf3wiHtYnmG84TjskgL/SEmwiE3SJoWjDpa
         BArEnvvt4iIkvao2hcxZtZ2dYNzJC0n5/N7Et43CLtXUuHdzcuu578aJij5oKviL8aPX
         DGsT7Zkrb8lh7Ig/g78rcDET1MPkD1TejIWLIlh2zV+ObP8z/y0Wfu2xt6xczCVp3LCX
         xvHoKLbMRd8thYLedjPIEeDSp6trop+4u74pE0pi7ns7oKYhjlkf6FubyIPsIVY+cd4v
         568fvRdD6L4mZYNSzAEZnq8i47tQHk01ZxabZncBwD6MF8Z+WiLPgAn3e8Yhkrdn11VY
         4F6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795281611; x=1795886411;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EToEzVRVg3WYCmb+Ipge3agclXFYn4/uigqheoHGHhY=;
        b=CdueBXoyJivHhnB+Nn82HmPfRWyv+2cGaxr3r2tCXkYWZkzgi7k9IBDRGrqPmdVF1Z
         JISS/XiqvWLXmOb5Rr3Y5mBsYp8uiAgDc71WsFH8zgo00is2jIeVjDTmy9yMzgXvCEUI
         ysZTYGpDymgqTVtvMEaSjf+HI/4oefChwoZ99C5GtojjmV98CCVwKjTWJozNF6mNTLN5
         EEvavy4TXrIc9lLnXO5DPvruoECSWip9nlZYF/O3dUD7jpKEn7LAREzh0uzCimS5v8MQ
         s9lJTOzczv+l/LlbYuzYtDGX5ktM6QT6ntx9pnRxtcHpyaZu8g/PUVzsEatUf1+cJHeK
         jLig==
X-Forwarded-Encrypted: i=1; AL+hErEon5bx+5OqhdPqpSHz6ejDF9zJThZiDsYAMVu9hxl7FF4xWzrjQHmEs1KmoP6lrvCvvPA5zx4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yVwfvXa+gEJkV0gw/k06+RrGRdqc2xArdgRhbqKK3DFfw0u1F
	hq8Cvkg/6kqCRiGQ+ySd5oKcVSnvuYFCSX6+o+ZkDyuXkdFngh7FRt7qSLDgLIis+ufJGFMCYqt
	bpFVcYjBhro57BvrJHXiuQS3rV+XxTxEeIXkv4cjn+j9TU6fDUvLu4oAOil4=
X-Gm-Gg: AZFdTZcSPKjBdJcPttqej3T+a/dO++icNdTIFE0VRteWHquOI6fTbngV2LPoxS9ASEE
	npaLHkG7ztxJu0OxUSLI6bw8ab8fKvfhbvFUVoVRO75LkBMvDBD6tkP+ZEgpNsJkPrLpcBpSJc9
	kSUgvUfL1TAG+TH9xSS8negSd63RNBjgPATJ8UQbVij9SVwlRUSiSS6bDMS6csZIbd1w0qfbiZl
	tGofIxfasc/XyJ5nNdC/rC8UHnDVhObJ3TtafxWrcSxJ9dr5KPRcTmTIA3xQunjz1jQBGR2/0nE
	AkSDc4jsyT98KRkqSpijGZ/D1ga/Hxg7QySmv7eblEs6ibQc78ahjuvq3clSN1kV5ZZJgRxnvnT
	hn3ykID7YUQC1kZnvdXtqdIRhaZsH9qDkyRWeBA7sQzbUhO7IyEtSW9ByzhETV27YfQ==
X-Received: by 2002:a05:620a:29c2:b0:93e:acdd:acd9 with SMTP id af79cd13be357-949ba7e227amr1113766385a.7.1795281611105;
        Sat, 21 Nov 2026 09:20:11 -0800 (PST)
X-Received: by 2002:a05:620a:29c2:b0:93e:acdd:acd9 with SMTP id af79cd13be357-949ba7e227amr1113760385a.7.1795281610513;
        Sat, 21 Nov 2026 09:20:10 -0800 (PST)
Received: from localhost ([188.152.73.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b8429sm299567205e9.14.2026.11.21.09.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:20:09 -0800 (PST)
Date: Sat, 21 Nov 2026 18:20:08 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: stmmac: eic7700: Use
 syscon_regmap_lookup_by_phandle_args
Message-ID: <awHSyEATb5sUMs2h@lore-qca>
References: <20261121170753.161170-2-krzysztof.kozlowski@oss.qualcomm.com>
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
	protocol="application/pgp-signature"; boundary="0OvQp1Mflhl1IUn0"
Content-Disposition: inline
In-Reply-To: <20261121170753.161170-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=H+5OUOYi c=1 sm=1 tr=0 ts=6b01d2cc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=7SHFOz60fl6yjfH7NaMA:9 a=CjuIK1q_8ugA:10 a=hsGEX8tnh7uD-6tXlA0A:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: fV67fWPkNzrD1LbqOw53PhcbkJ8uHfji
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDA2OCBTYWx0ZWRfX8mOgLdgsI/SA
 obfVQ+W4BHvwg/yPR4nOxThk1Jw34oqSrqeO1NiDV45iytG8/ymm67oAq4eghYpKAzwpiZL4AVL
 eYjWAdhIpLclacLzOrmTjUhHdM/VcPw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDA2OCBTYWx0ZWRfX8JWWyMoCXZok
 x9SZYrq+Zc8FAntj0BC6RPdFTuizqntSym1qv9c63JwykjVRHKN30RRUV0CNldLzFwyKFPDOQ6N
 LBoE54fGkipH+Kd4wZ8/aUdTvxaHm5cqTI57asi05WR0LpaHzlLSB9Ns1tvXDD3YOYXLusnoOaR
 u+yIO/oWQ2IRXF5D8OivrMC0rsL7tUWpl+UkLw3jc2UytY/VwxszyUtIRvkXnTrsiwqSWRwAdS/
 mrFNywpLJ6JgjnEiXlmiSEPQpkkhIYCOYiY9U7CU8xfR9t9K5OetcXWAxqmtjHa3+c+9++YSwtE
 /vejDPGb2RxRjbV0TNWuTnaANcvv/48Y8iDnL0PPMN3O0Z4wQDaGX9lE8rbUz4lnDDlHSCmDvt7
 A/rkqLehIfnaFPHM/N2w/F1vCFILf7NFc+XubsPzeYJ/BnRoJxIQAgkJ6BSVP6KcN9y9tj2kSuR
 NTnOLMzLokMUfJfk2YQ==
X-Proofpoint-GUID: fV67fWPkNzrD1LbqOw53PhcbkJ8uHfji
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611210068

--0OvQp1Mflhl1IUn0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
> syscon_regmap_lookup_by_phandle() combined with getting the syscon
> argument.  Except simpler code this annotates within one line that given
> phandle has arguments, so grepping for code would be easier.
>=20
> There is also no real benefit in printing errors of missing individual
> syscon arguments, because this is done just too late: runtime check on
> static/build-time data.  Dtschema and Devicetree bindings offer the
> static/build-time check for this already.  OTOH,
> syscon_regmap_lookup_by_phandle_args() already handles error case if the
> number of arguments is too low, thus switch is safe.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
>  .../ethernet/stmicro/stmmac/dwmac-eic7700.c   | 30 +++++--------------
>  1 file changed, 8 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c b/driver=
s/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> index c229275b11b3..287f717ab3ed 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> @@ -170,6 +170,7 @@ static int eic7700_dwmac_probe(struct platform_device=
 *pdev)
>  	struct plat_stmmacenet_data *plat_dat;
>  	struct stmmac_resources stmmac_res;
>  	struct eic7700_qos_priv *dwc_priv;
> +	unsigned int hsp_args[3];
>  	u32 delay_ps, val;
>  	int i, ret;
> =20
> @@ -254,33 +255,18 @@ static int eic7700_dwmac_probe(struct platform_devi=
ce *pdev)
>  	}
> =20
>  	dwc_priv->eic7700_hsp_regmap =3D
> -			syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
> -							"eswin,hsp-sp-csr");
> +		syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node,
> +						     "eswin,hsp-sp-csr",
> +						     ARRAY_SIZE(hsp_args),
> +						     hsp_args);
>  	if (IS_ERR(dwc_priv->eic7700_hsp_regmap))
>  		return dev_err_probe(&pdev->dev,
>  				PTR_ERR(dwc_priv->eic7700_hsp_regmap),
>  				"Failed to get hsp-sp-csr regmap\n");
> =20
> -	ret =3D of_property_read_u32_index(pdev->dev.of_node,
> -					 "eswin,hsp-sp-csr",
> -					 1, &dwc_priv->eth_phy_ctrl_offset);
> -	if (ret)
> -		return dev_err_probe(&pdev->dev, ret,
> -				     "can't get eth_phy_ctrl_offset\n");
> -
> -	ret =3D of_property_read_u32_index(pdev->dev.of_node,
> -					 "eswin,hsp-sp-csr",
> -					 2, &dwc_priv->eth_axi_lp_ctrl_offset);
> -	if (ret)
> -		return dev_err_probe(&pdev->dev, ret,
> -				     "can't get eth_axi_lp_ctrl_offset\n");
> -
> -	ret =3D of_property_read_u32_index(pdev->dev.of_node,
> -					 "eswin,hsp-sp-csr",
> -					 3, &dwc_priv->eth_clk_offset);
> -	if (ret)
> -		return dev_err_probe(&pdev->dev, ret,
> -				     "can't get eth_clk_offset\n");
> +	dwc_priv->eth_phy_ctrl_offset =3D hsp_args[0];
> +	dwc_priv->eth_axi_lp_ctrl_offset =3D hsp_args[1];
> +	dwc_priv->eth_clk_offset =3D hsp_args[2];
> =20
>  	ret =3D of_property_read_u32_index(pdev->dev.of_node,
>  					 "eswin,hsp-sp-csr",
> --=20
> 2.53.0
>=20
>=20

--0OvQp1Mflhl1IUn0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCawHSyAAKCRA6cBh0uS2t
rPlnAQDvFThEV0w9sN0ihzSOFueg0SkPnLH7gOu/w6OxmOIKFQD/ecz5Rb5UjmPu
wcE4gdPGntcwSBsNbPzD5kliXTV/+A0=
=TTZe
-----END PGP SIGNATURE-----

--0OvQp1Mflhl1IUn0--
