Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795347365;
	b=MXTvyEdYdIK3ZXz5eh+NGui2VPInmYRtXrILKtTt7CR8HZOFKot8sYEEawC1u4fEcExq
	 Wiuulug26+DPBYwh4e+09XsmAWiHbn2OSLgQOqq3+iUtzfLvajlRVDYlWYagmhyS2j8WH
	 RSeBexm/dVAdkEIkrxS5ahkNUPfHHLwGKOp5coVm3q9ENCxgWY9ryBqdK10rZGtzqsxsZ
	 5rhpf1YL7gVEc4561XFNiloayYstCaXcdjGtZEOHcNkkKgibm0C7SDlsrSTOji+snjHlC
	 5jLGhlsuiLdjNHM/6+0av9TVYLmyH0ksX0zMg3bYfoIDEdof/R2TqlF0imF+AKROUWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795347365;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=muP6DUXg9dLTYnQcGiDX4DlIbKU6QaKtbQTgxjz4/ac=;
	b=pEeag9E75xv6zDHhCLnV5fket8OthWjLsxXKHAbDYL1MM+bYDvP8FkF30t8zz6THrHUZ
	 +x8y0SBIGgjU7XWHwAIuR18YdU7BwetyETzxaDj4b6PpaYmeW9h4lHsLgis5f3lIjYtxL
	 M+1i7LdwLpOdZgoS5i8UjB2kOfaDaBl7YMM/vz2jL7ukIz6LBUXxIBaSjJEd2/8k0wVUN
	 wJw3sW4B1AXOBgQJ8EFlVIFuncjSGaqfMtAMkqVE3K3USi5T1hnlI/B9HCMEY1Iw3CEr/
	 CyMmIUjx3gtAFZ/IE+akEY4rM+tGPhAM4PCc70if4QkbYQOKU7omLFNvguKL+n0onlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OoVMAZwD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Du7TtbHq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B161606A332
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 11:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B161606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OoVMAZwD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Du7TtbHq
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM870x9364977
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 11:36:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=muP6DUXg9dLTYnQcGiDX4DlI
	bKU6QaKtbQTgxjz4/ac=; b=OoVMAZwDbDBmoUb8eL+mcd6tZqZuGBWTCaYdmzvH
	a4LczG6uBQdDCngULHnaLsEti630LKNx+rmTtFs/DtrydtD+etmxlurqOl60/gn3
	5HHU2BY5OGxG2VD2QNT6ZM4IcAsQEBWBConkyp8WWHj0heYkBstjxkcNanBWsPcH
	OG/DyLDsLAvsoi8fjVEgRoUsXnrvThzLU+KGKhUdDeFOLRG6iCmsk79EPQZ+qSYt
	PJblJILb8la5oFCW59v4HjjtHQZO3RHoH2RaiBTjKvuKhH19y9LLwsm/kyZJ4PxJ
	eWZmY1U2a5M9ztCfItMRjezgsGRXbsG1FfPJWtTehEIT/g==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32w03a2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 11:36:03 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b56c696405so2078336c88.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 03:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795347362; x=1795952162; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=muP6DUXg9dLTYnQcGiDX4DlIbKU6QaKtbQTgxjz4/ac=;
        b=Du7TtbHqr1vjCwWUmT+Gkp1MRR6z0kDHQ0awROW0/OoGhKnynW3K65dzjWb6dmyU/V
         iS0QBbi5JpEXDiZcsDzxsgMsQkPRth6t8jKTLZ/707UwSsSDPcZb+Ci1TWKRj6O2Lhll
         7L6zcQ+p3Z0S5l2kzgPZLX9Q3l8aF1FBfJDmI0OibFYtdCG+3u4q6Q2EYdIUyHOHCV5i
         /MttkT0EwY7FYygub2MPZtVEY8vlzglni8b7vxHJsn42VDxmmUMSq9bc75gltsdB32dp
         7Bgcre3jIhv2HAvJJvcbq10WZW/uBKWGWI+IgbLLxE9L5h0/sHMFafLrm5ijBYQ2kbuq
         5drw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795347362; x=1795952162;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=muP6DUXg9dLTYnQcGiDX4DlIbKU6QaKtbQTgxjz4/ac=;
        b=YDneW0rHe28yoeDZR+Sn3UcdNWS5mp995vl+zGsoPzx6f4jerv2ZN0r5ACWSbUEkg+
         iZf+yllDL3rFm3DnCNDYDjoIh/2nTUAOO3mQwBS1E60O2P66+hlVyOwiuP+syIBUSgqn
         HeJTENx5bGporNfQKN0caWwuu2Dwj0uK0X1bjrqxZaryGqJ7rLhlXwU2elMw9NvM+xGw
         jrkl86TdPOfXdc0q8Hnni1zUhF4ed3BqdeHGT35SqXGS3dOXW/ci0zXKlyEMHTCgM54q
         tpt3+vgqccNvuy4mlMsCeLukLA6OTQdUe5FlMd3GC5shU6L8CWKR337ZIpjXmatJe0Vl
         V0Uw==
X-Forwarded-Encrypted: i=1; AL+hErHGNLYVkVl935uvuLrKQLvnHUJFypRWFlLP0V/tZOHtGf2LXHaUJsJvOaMup0nxA+hnEqaDKgQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TecTSuLRFf/Pd8y3GZ7Sv/YCoBxii2iZ+QvqFCXQnsu+eBzr2
	IHUvKyIsqU6E1XE2EE/l+2kzgBkzCpn9gkSDDOZK+6Ymqqu7umbF8DjaGi2//8fspHoJu85/ecS
	z9wTFJF2wgBHz03cE25zfp77xKPVKoDaQTUWx6aZqBHc5c8cG3R91Wfatjco=
X-Gm-Gg: AZFdTZc3ib+ZqU3QR49+cLNn1dCgcHRfoqLJPKJ4Af+gnOsXaIT3CrpEHkWNznvm/fQ
	v2b1GMPY/uLCRZuhJqbH+JHvudJZ+i357iGKhoBBuMh10PKed0TaFKPvjXReo5f1bDz2JggfGyW
	VRto4MnlyEszZiCg+Rs2vbszqQnO2eKWwyX9oKS4gkDU/a+Cny+wthHgQG3RRqpjIugLju1EYPW
	iJcyE8dEoXAktZ7/B6BqmGiFVIj+6m+nE/2fqSK6jNikgkOOLYE+GUkOqPD837WBESUWO9c+ZOL
	3wrrnckn+Iy6DzC2BVVhj90uZO4HnvMN0/YYEzMl71KOf8cEvvv2RR3iGpsr74uw0wXfjwMDgI9
	BKQ32AkDHp0kYFztUgNJXbOwSZdLv4fm/6JupISRcj4pgqRiTw/udEsDw0fvdK8I=
X-Received: by 2002:a05:7022:7f04:b0:166:af48:a2ba with SMTP id a92af1059eb24-1b5566fdfc3mr10202025c88.0.1795347362058;
        Sun, 22 Nov 2026 03:36:02 -0800 (PST)
X-Received: by 2002:a05:7022:7f04:b0:166:af48:a2ba with SMTP id a92af1059eb24-1b5566fdfc3mr10201991c88.0.1795347361468;
        Sun, 22 Nov 2026 03:36:01 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm23234990c88.13.2026.11.22.03.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 03:36:01 -0800 (PST)
Date: Sun, 22 Nov 2026 17:05:51 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
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
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v4 03/10] dt-bindings: net: qcom,ethqos: add
 qcom,shikra-ethqos compatible
Message-ID: <awLTl77S5Pj0Maok@oss.qualcomm.com>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
 <20261117-shikra_ethernet-v4-3-c41902e5f2fa@oss.qualcomm.com>
 <20261118190745.GA198891-robh@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118190745.GA198891-robh@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA0NiBTYWx0ZWRfX6QL9yzyEmJrM
 74Qigs0rc3kTfSwltsL9MiapOmMwq2aAPTE/3xj4j0Z0zftCWfEX8mMhR0YOfD5wiikOWh4Vgwc
 jRFLej+CXu+BabIDlocoE2xQ+GeKQCOaJcrs+HZpClTikRggZD3rc4c0pHO5LUl5UmIiyKGgo+R
 HaOmiDCyCbDKuNP/FL3RNgaso4UAMew3hCZHtBcbGUVTID4i3OXR4HYS0KNEaZRUZP5HiJGlSUr
 xjExDtos7tSj7WGmU8/peFWh0g99Q0bzMM3bbf5VAO065YrwjZS+dtFAmmTZPdW5Vnlj4aXM3KD
 D9IepAPSqyZOltp/c8X69kqjop5lmvN0qhL7bzufUrI/zAZogDykIrFzRehlPv1ePIsFxeF7z1F
 iEhgzjXjhv8BPJI9tq0bHmQ6GUuk99QOqo1Qd4heUdXFHLMMv8txyuHRERRXDRQQINJza6C7nKn
 aqSzjmE79EDwWnXADiA==
X-Proofpoint-ORIG-GUID: mj2GUvt-fSd6gbystapJaM-BVW1RDe7I
X-Proofpoint-GUID: mj2GUvt-fSd6gbystapJaM-BVW1RDe7I
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA0NiBTYWx0ZWRfXxLy3mzd8AyZN
 fHxN48aFFGhYtgxoeLpIukXhnffBF7Wl+36f/OMbvG+HbH1fLL99gjoieWc8Tq1M9XkKv96D8Xz
 sJ162eXECm5W9GWD7LZD287pX7sGT+Q=
X-Authority-Analysis: v=2.4 cv=S+dMU4sP c=1 sm=1 tr=0 ts=6b02d3a3 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=cC9zmzg-b8Z3h8VEsn8A:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_02,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220046

On Wed, Nov 18, 2026 at 01:07:45PM -0600, Rob Herring wrote:
> On Tue, Nov 17, 2026 at 02:15:23PM +0530, Mohd Ayaan Anwar wrote:
> > Shikra's EMAC requires two additional clocks for NOC interconnect
> > access (axi-noc, pcie-tile-axi-noc) beyond the standard four, and an
> > OPP table with required-opps to vote VDD_CX to SVS when the NOC clocks
> > are enabled.
> > 
> > Add qcom,shikra-ethqos to the compatible enum and use an if/else
> > block to constrain Shikra to exactly six clocks and require
> > operating-points-v2 and power-domains, while leaving existing
> > compatibles unchanged.
> > 
> > Add the relevant compatible to the binding document for snps,dwmac as
> > well.
> > 
> > Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> > ---
> > v4: moved operating-points description to the top-level, and added
> > power-domains as a required property for Shikra.
> > ---
> >  .../devicetree/bindings/net/qcom,ethqos.yaml       | 54 ++++++++++++++++++++--
> >  .../devicetree/bindings/net/snps,dwmac.yaml        |  2 +
> >  2 files changed, 52 insertions(+), 4 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> > index ef520f810577..6bd4bded650a 100644
> > --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> > +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> > @@ -14,9 +14,6 @@ description:
> >    dwmmac based Qualcomm ethernet devices which support Gigabit
> >    ethernet (version v2.3.0 and onwards).
> >  
> > -allOf:
> > -  - $ref: snps,dwmac.yaml#
> > -
> >  properties:
> >    compatible:
> >      oneOf:
> > @@ -32,6 +29,7 @@ properties:
> >            - qcom,qcs404-ethqos
> >            - qcom,sa8775p-ethqos
> >            - qcom,sc8280xp-ethqos
> > +          - qcom,shikra-ethqos
> >            - qcom,sm8150-ethqos
> >  
> >    reg:
> > @@ -57,9 +55,11 @@ properties:
> >        - const: sfty
> >  
> >    clocks:
> > -    maxItems: 4
> > +    minItems: 4
> > +    maxItems: 6
> >  
> >    clock-names:
> > +    minItems: 4
> >      items:
> >        - const: stmmaceth
> >        - const: pclk
> > @@ -67,6 +67,8 @@ properties:
> >        - enum:
> >            - rgmii
> >            - phyaux
> > +      - const: axi-noc
> > +      - const: pcie-tile-axi-noc
> 
> These sound like inter-connect clocks. Shouldn't they be controlled by 
> a interconnect driver?

On other platforms, yes, the EMAC AXI clock is only a gate, and the
interconnect provider scales its rate along with the NoC.

However, on Shikra, the EMAC AXI path is fed by a dedicated GCC RCG:

  gcc_emac0_axi_clk_src (RCG)
    +- gcc_emac0_axi_clk              "stmmaceth"
    +- gcc_emac0_axi_sys_noc_clk      "axi-noc"
    +- gcc_pcie_tile_axi_sys_noc_clk  "pcie-tile-axi-noc"

This RCG is outside the Shikra interconnect provider's control.
EMAC DMA does not work unless all three clocks stay enabled, so the
EMAC has to hold them and also scale their frequency for the line rate.

I am hoping that I understood your question correctly, please let me
know if you were asking something else.

> > ..
> >  
> > +allOf:
> > +  - $ref: snps,dwmac.yaml#
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: qcom,shikra-ethqos
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 6
> > +        clock-names:
> > +          items:
> > +            - const: stmmaceth
> > +            - const: pclk
> > +            - const: ptp_ref
> > +            - const: rgmii
> > +            - const: axi-noc
> > +            - const: pcie-tile-axi-noc
> 
> No need to repeat the names here. Just 'minItems: 6'. I suppose you 
> might also want:
> 
> contains:
>   const: rgmii

Understood, I will make this change.

> 
> > +      required:
> > +        - operating-points-v2
> > +        - power-domains
> > +    else:
> > +      properties:
> > +        clocks:
> > +          maxItems: 4
> > +        clock-names:
> > +          items:
> > +            - const: stmmaceth
> > +            - const: pclk
> > +            - const: ptp_ref
> > +            - enum:
> > +                - rgmii
> > +                - phyaux
> 
> Just 'minItems: 4'
> 

I take it you meant 'maxItems: 4' here? If so, I will make that change
in the next revision.

Thank you for the review.

	Ayaan
