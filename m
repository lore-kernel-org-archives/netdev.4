Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794947682;
	b=yJ2h3Mu3SB0seJPttpiZPp82K5m8CrfJCVWl3fjSh7UuONvXcs0K/o1pdgxlCq/STZd6
	 Ny/KXv9ntJK+vATnL8sDQf9Lp9K8sjW0LAh9SKz9BEFF96hm/+Y2t7GF9PxoAkBCtOaUG
	 kRZSettGGFEq1WCalBXAOMdLUNNxRdzzTltUp9jpfDukJCm9L3okQ6d/eWdIQQF7Ru52U
	 sqwpvWDmNHZo23He8WLmglJhlBBLffhdOVrOaixRFBp7maOe7T92QcZ4omK479SRp45f+
	 VdkfMLWHp+7CVwTPrwc2h6M8zIgI/EJhzDs2s3TsPMKMl15Hyg7LUYw51p/31oeFmdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794947682;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mZIjSl/6dyPO7xcK3i9ocK4466rMnfHhcIzCnMUr9CM=;
	b=cIMmH2wkT0PoUpXP9VjK3ydiaPtmBBEoaJvEhXqhMK7dVeJM0xNdTxWBKuWKmmeIlHhC
	 gUHDNtpGj+pM4eCneHqju9r4B7rg53zp20q1nCuiSO5M6druG94k7qcAZaAZqtCr6SYSI
	 X4bJecgyShoSBnXGMV4pTAdc3pKz0OC6pL5uta3E5LFeWToVjz1QGtXpli7qVuEkw5Bno
	 bpSRk2IrcQB4HfQLyQIYZj+zefh6ObzjrhYSO+sZyP0oF2poA6Wryy6Cv0hTg+xXrqIKa
	 HH18Ojf/ymsJBPvwWr+2JFkAnKHsjJbvMX2vcSEphF6jEvJUqBCo2VOFvZx8XU+pnLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oL7MWMs0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LYLd0NCG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F13606A339
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 20:34:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0F13606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oL7MWMs0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LYLd0NCG
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHJ6O4e997700
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 20:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mZIjSl/6dyPO7xcK3i9ocK44
	66rMnfHhcIzCnMUr9CM=; b=oL7MWMs0eeXbE5b7oLTpoNhUZCCSK8bHHhruSaU7
	BPBdBF8mWzMLEWzguZLAINIvYbWBRFITWRI5fh+QCUk0o4bqyCF5IgKDP0zYI9ms
	VJLQ699LUUFVzhsDJs7aa3dNktELq3rpnqFm7DyFHPJo11cpVUffLJUorZBHdtmN
	YrsWHuYzpit6omz3zDpmwgz+KdR7GwS7t34Vq2FJy4XV/BXkYENC0qg1LC7lIJqZ
	rgxjNQEHunt10tg6IPmq/fTMVwbAU79+kxoA8WHmwxa7PO6dCHZ6+g0fBWUgb2a7
	OLvRSt6xxjcjtxCgmPLG4VhLmSCwalnH3bz27Pupd3ASFA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0tbu956e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 20:34:40 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99939c0007cso63152241.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 12:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794947680; x=1795552480; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mZIjSl/6dyPO7xcK3i9ocK4466rMnfHhcIzCnMUr9CM=;
        b=LYLd0NCGudVyH47rHbLgly1nCYldPPPBc8XZXG0Umvsjlqmi94CECPLi7442ANQqWd
         4LH5c3OG4uf5CImEGfv87hD9GQ7CemHMlfmICyfOu5hY6LlET98n1KcG91QalIg7j5B/
         Hku5NUvwhJDzQxlcrnKWJKr1DT8hbctUPJHPOQT9qEwjprtsA+6QPUbbExcvMMZKLkbr
         3AS/RZTLXg6nRMADsrBsM2p89GNgv6yb2DowVS3KJ7CUfEfr0tiRY5t2GUcy31u6YqWy
         6mxxreyKN1/mQE3xzd2AcTzBEwnm5D39gejkJ37NbLwUabaBuinrKvhB6zMxNV9GGiX6
         zqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794947680; x=1795552480;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mZIjSl/6dyPO7xcK3i9ocK4466rMnfHhcIzCnMUr9CM=;
        b=tgyt/EJ0leHj9EkH9oxjtjnJZxbg+MKROL99/f1OwKF0Nu5sDLfK+QlTyU2f43p82l
         mAd2kKPyGYWyBGuBK2HuVFcuslWJCDrOHrY+b9YpWjed7pKEygPxzkjTHvRUm3XLLO+S
         mMaIlTlt0fRZfO7gzkmjFGuQ5JUrEx9RXu1tyEggGfnDAk8UqrU2ZuqphhSSisenyA9g
         n3xgv/4YOOSMAOt9xwZWkTAldk9RrbTCZ3b8qPde0xJhs6oQK68x1A7hxM9G2y6UsJLB
         i+EaDNRUfxjltbglT5XBMYSte72Q/PqtdznhIYPufLwhOagJKBs/7+Stjaa7R2Hs9v8q
         IzIA==
X-Forwarded-Encrypted: i=1; AL+hErGpNBM/pTQbhOt7IvM9QbcvykdFtRw2AXYhvqqorLtIZGyY5F3cikYBmgCvj+jOO3JaEdH06wY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KbSVls7fYs5ZtO0Kosok61Zx63DywtkLaO61X9mCP4kBJofg5
	7Dh6bm8UwcBUdJVep7zM14LnSuIDMp5gyXkz1ldd5LJY1nuTMLMtuhTlSJrJd1oH1dXwQBHqdtq
	Qp1O8wARClR9hYCDWvFjXTlIDnZ1K0UzR4GNj751t1nVjJygIqZTfMmwmAYA=
X-Gm-Gg: AYBFou2fYNvDcCgDq0wlKG5jngSqe54FVsouHj9tl4dUMQqp1vyMDiAowPAuMDYCZZo
	lu+g9Fq2b7q1BcpALN/Pc3Wrfz2zkVzIHrIHyD0EQ4tUSbwtm/TSNTnr6vWd4Ali1eIRcqRY8L7
	gxCBpJCcI4+d/kqX/EBYf/ogOZVS5/VPjiYSuLJnpcMmzvOj3mXMb4Ik0WxVBzdHwl6tpY7IXUG
	c3FeVUV1X+2sHy2aIS9hgzC0Q8lrFQogHMSzHFNN5VoWUdKKLazv4fXvOZ4mq74Xy9r7xnuUA8u
	3ZiKUT6FTwp0s/ENPqCZuF8KAl1XiA4FwWsnvWHS1E3bfiDfwYUBG1BU0Td5MprbJO7D19beKr7
	ea3h49M+aqlIWhdl/XcFnhkEQGtPDbat/k321XD2y5Hd0t0H3Fus7xYh8NXK53qM=
X-Received: by 2002:a05:6102:1608:b0:7c3:72b7:7fc0 with SMTP id ada2fe7eead31-7d6ba3b91edmr61862137.13.1794947679669;
        Tue, 17 Nov 2026 12:34:39 -0800 (PST)
X-Received: by 2002:a05:6102:1608:b0:7c3:72b7:7fc0 with SMTP id ada2fe7eead31-7d6ba3b91edmr61837137.13.1794947679066;
        Tue, 17 Nov 2026 12:34:39 -0800 (PST)
Received: from localhost ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d4e670dsm10938425e9.1.2026.11.17.12.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:34:38 -0800 (PST)
Date: Tue, 17 Nov 2026 21:34:35 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe CAVALLARO <peppe.cavallaro@st.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: preserve RX checksum capability when
 offload is disabled
Message-ID: <avy6WxJft6Aex-oX@lore-qca>
References: <20261115-submit-stmmac-rx-checksum-capability-v1-v1-1-ea26fa3689be@gmail.com>
 <630b9651-3963-4686-a51b-b670beaa45bb@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="uhqeACAWVMDeZ6jG"
Content-Disposition: inline
In-Reply-To: <630b9651-3963-4686-a51b-b670beaa45bb@bootlin.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA4MSBTYWx0ZWRfXx3mxq7ll7MUK
 Vx+d5nz3HIgakQuq5YjvDqmzmBPWf0KM8y8fW+ICqkV1suD8HKP+NtjMCQs5QT86nPRDuI1zoHd
 wKSzUcHL0n8BLgx6uPq1YLE1eFAiZOzj4ZblD5+QtCYO7+g7EEU/k7VvHZjEROPfhrulo2l1RP4
 +TtKVPws3Td+O2oOmi7u8YxdIDYy9jagsmHCr3sxS6aj6GLQASgOQRjh0NDHP/mrGwX1i9Hau/v
 kha6nl+1GUsV34zzZU7av6gPg5HjLffoMUek+5pqn9ixQYJQ1li8lFdVougreMGIMXPpnKZbl+S
 YWgxscKkq1hhzVjVslbCiZM0A5PoieumsDN6/cOW8eHCpYl1u452fvgSbCD2Cts1FHrSitwHydT
 EIAqRfc7nAPwsmUsI+sv4sEqc15Fws3iQ4qMtOLWSV3n+v+15GaWxO8GkQDSbRGdM6gBWNb+aEv
 98+XL9BnsAmYJRh77Mg==
X-Proofpoint-GUID: cknQFa75tq_w1Tvw2hsZnbvmBX9ZeV9i
X-Authority-Analysis: v=2.4 cv=FeOiV5+6 c=1 sm=1 tr=0 ts=6afcba60 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=9R54UkLUAAAA:8
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=ui44w_YjaUHB-fKmfF0A:9 a=CjuIK1q_8ugA:10
 a=dSt14DRd3il9wOMU6T0A:9 a=TOPH6uDL9cOC6tEoww4z:22 a=YTcpBFlVQWkNscrzJ_Dz:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: cknQFa75tq_w1Tvw2hsZnbvmBX9ZeV9i
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA4MSBTYWx0ZWRfXzJ46jtmt4mQg
 42gOMWQp9tOom0/KlNCikmnh01nb8y6mM5RSzbLnujBo4JQIQt2nXZzErz6uMlmF/ucvlEy5crC
 q8Pf6u4jxWSE/78OTVhhKZAcWqC2BjU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170081

--uhqeACAWVMDeZ6jG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi James,
>=20
> On 11/16/26 01:49, James Hilliard wrote:
> > The GMAC, GMAC4 and XGMAC rx_ipc callbacks return whether checksum offl=
oad
> > is enabled after programming the requested state. A zero return is
> > therefore expected when hw->rx_csum is zero.
> >=20
> > stmmac_hw_setup() treats every zero return as a lack of hardware support
> > and clears plat->rx_coe. Disabling RX checksum offload with ethtool and
> > then reopening the interface loses the saved capability. Subsequent
> > attempts to enable offload are rejected by stmmac_fix_features(), which
> > uses plat->rx_coe to filter NETIF_F_RXCSUM.
> >=20
> > Only clear the capability if offload was requested but could not be
> > enabled. Keep calling rx_ipc when offload is disabled so that the hardw=
are
> > is still programmed with the requested state.
> >=20
> > Fixes: 0f280e4d23c2 ("stmmac: fix the rx csum feature")
>=20
> This tag doesn't exist :
>=20
> https://netdev-ctrl.bots.linux.dev/logview.html?f=3D/logs/build/1212156/1=
4986330/verify_fixes/stdout
>=20
> Besides that, this is legit. Tested on AgileX5, CycloneV and stm32mp1:
>=20
> ip l s eth0 up
> ethtool -K eth0 rx off
> ip l s eth0 down;
> ip l s eth0 up
> ethtool -K eth0 rx on
>=20
> Without patch:
> ethtool -k eth0 =3D> rx-checksumming off
>=20
> With:
> ethtool -k eth0 =3D> rx-checksumming on
>=20
> Please respin with a correct Fixes, feel free to add :
>=20
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
>=20
> Maxime
>=20
> pw-bot: cr
>=20
>=20

Reviewed-by:Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


--uhqeACAWVMDeZ6jG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCavy6WwAKCRA6cBh0uS2t
rF/MAQC94F9flu7V6ymO/GXi8P606jehIfn/ClLwmubRWdBLwgD+NBZl2irSTcCd
Ctt9MnmK8y9WyqY20+Ps+VFO9H9BxwU=
=Jn6z
-----END PGP SIGNATURE-----

--uhqeACAWVMDeZ6jG--
