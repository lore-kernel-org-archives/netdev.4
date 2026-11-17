Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794920637;
	b=Of26czOB+0KJiKhelEphZryTEaYtHd+4+VOF4cGzUKpw1pUj4GwEm4pCj2QRysSvL4Do
	 zAqXfeg6Pui4Y5li9eso3eIof0yK8CRMrUYMVt1S9VSg7BGWgcYUAPAn+M+MaxfDbMnX3
	 7I/s5L2dTpxBykIY6GosW8owW26vkZJeAJu4emnEbfdmeGeEtkCoG89peXmLVsW4jFSGe
	 glfiect8Jboo61Z13V5YO+3GQao3XJFXbUt/x7yl5kofoypqn/Iorr7xKbsNBc++U/gZW
	 O8dHRZFhhgLywMB+DGlhc9UkThLALHOkoX1Pkq4HQ/LOBMxVGe+nlrRszpOuavtupGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920637;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1z0nrgeiBBl57QVoEdYEq+j3cNVCObSWB8q/eNPs5nY=;
	b=esDRMlgU21zdkiBQqXnmpQPcyLzFzhmEFzQehjfYiUkGOA5i3g/75wgUXwCZYYBVanNL
	 UDKc0vsyf9epYQv9bYx8xjgCSZIHWS3ahzb1+e2oFGNs6ACEibEfvYIlCnH+zZLx+a1Jr
	 v3cKbfGCJnpm8YVufoO50cSjT0IgMUg285RwmcI7fPInex1wtNxisHevn1Ugjj66vCdhM
	 aouHAWkNrQlEKu+RyNR7890KgEBRuMPcjkcw32iUYD13bVFyFbxHF/9UJ0dSuyER3SKc9
	 DY/KvLq9nS5EIT8q0yqXJwfPL01XIbtGjcluy2iX70k2K+75e/nf7uigWdzDEcJGxpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z708Ontx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DrclhhdD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F97606A323
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 13:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05F97606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z708Ontx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DrclhhdD
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC1QxC466946
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 13:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1z0nrgeiBBl57QVoEdYEq+j3cNVCObSWB8q/eNPs5nY=; b=Z708OntxTIeiu5xP
	JQo/syo6ixFFvp8O3tcgIJXCVoAahWzRbhduZ6QukD3Sv+2dkDVsH9UfB4svY0Bx
	L73an1q7vj0+lMSePFWRnhmoked7pOlnlSJJr16JHnOu76wKAh0nQwbOWGdc4jBS
	uq3/J0CcnDOdS2ALTsDBRhUd7R5CTh83GnKnJk3uZ1qX9jDYNwGFxZRcZXZv9jsP
	ggifrH4bpm74JcFXLkws1clbpYBzuRHCWiVGNwisBr7dS2y/SGRh8grvg/HFooms
	IH+1gnIyc5ZryvMgtXimfK1+ElT/MV5etM9x6NIpgPSCUUuUlCv7vMEho3T3tGIl
	ZYBYlg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09htk7a7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 13:03:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-944138ed63fso703799285a.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 05:03:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794920635; cv=none;
        d=google.com; s=arc-20260327;
        b=EK5LSJX7npPREuGxg2vQNJBou2AXA1o1rU/9xQWtw50TmHp/GCc+YWsOTqzLt726Eq
         5LN4jyoO7Ok9rOnBBnBfrPCUL3hKf7c5sQ9s8/rkX2xbHS4kQQ1PzRJ4eP2IMj640KrW
         6vLVCVZRIReSNKHVmTbNZ4Jpri06dEFgjeXuVXfahe3rIFYgafvpOxNsXRyCboBDWbaf
         rPfYqCHFNf4z+hA9kxlhdNZRXk4/HLQK5qIveCzi3bFatgmV64ZXeucVlNzTd5Hp6Whe
         gSTR5UGWRmBHDB3thEDyV1UtlgVDps1JYCALWQWkRpVPawOAbo6fgnFWuZjMtUpvB6q4
         UGZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1z0nrgeiBBl57QVoEdYEq+j3cNVCObSWB8q/eNPs5nY=;
        fh=muugsLYCV91s3H8pmM3ht2T+VQsmcsoURCKjZCkxkuM=;
        b=dEPRNGlTeQIBnzFYuQb8Z5VRbZr6umhdWTQsw6D/Hb3zR4aen4IfYs79eSX5r1wuHt
         pM2WunZ3owviQOTzHYkmjYG9SNik7Y39GJPSOtReLYRvcnelJ6bnZ+kezvkngq7BHKWI
         i2arvaxx9KAvvK0dqTYbtJ2NRIRkaYjTGpphNqABy+cdw5L0POymjF4dQCh33p0SgEr0
         aJer7XtP11cWp6QbyWpSky/F2ai6wqXCq/nfjfsmkBoIYcM8Nmlt+nkx/wBqPUNjaX8m
         JSPPnlJJ744z8qiZHRb9ZuRW2jtsUUjdd3Ar9Wx9SiAuFuxMi8W6L0QALl5dMe8PF09w
         Rn+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794920635; x=1795525435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1z0nrgeiBBl57QVoEdYEq+j3cNVCObSWB8q/eNPs5nY=;
        b=DrclhhdDSKo5bfDRMkPipF0VnlKtUvt3Ak1Ubqp/nFTmnosbCLodnTYMpLfnitfinv
         8hiTJ/FNr+jWE2XdfAuAt7Ds95toPBIqk1m0aW3VqU/mPbGmPAEX0n+34AWR/gLiGivJ
         Tu7ARACpHUPBdqmrHZrnSiHoQi+RmYeJIR6xWCKaWmk7/Itaf40tUW9ah4exW4qN+4Bs
         XzfpX4pXxEM+NHETSlZLawLhOT499pHJhTTPN7u2E+YPsGIFZwd/UuOgjwrwgRXIJLIC
         wPUHq9rgPyQQloQgHUFkn/oKuYVSFQ1P4JJdOBG/dTECNxmEDYyEFf9Ocbpi7Sx98zQm
         iMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920635; x=1795525435;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1z0nrgeiBBl57QVoEdYEq+j3cNVCObSWB8q/eNPs5nY=;
        b=Bm3yCAdW4YuifWMLhNjdUkyuFD17NwFlDvnTPWevI5OqSlX3WaCD3GYiFLzmluONg+
         Lj0kAem1xCfZj6cBGBZfOBOmSZ5mi8XyVJsbh2/vxnv0WKpY/ykPCANEcv4s1fIlcBDR
         gFAf1fFaWvzXwL6n/25zlHco6D7fW0c+YZzCA+w+rC2d78tDpxh6vUOfFFY7+21qmi7b
         GBMMBjykTZUmF23Z0FF8sJPxEOwOSpeu7WMtaEsdTwkS1yZDt0sk1/bG0H732ihkUtYa
         hZATanM9kj9+28mOTHcxX7h2OLNU6uGSJhAuzd650eNwoZPELR/sPfecT/VmOnb1uThN
         80TA==
X-Forwarded-Encrypted: i=1; AL+hErGe56q4fCTmhLE9/dGoC3iES7rhX4VYw4djsoxde1Hcu0cNNummTKBqW3wIz7Fj0kblo0I/hrY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5ttxIUMBfMwmZoyGNknaNfVDEdKul6eKogaPv+8QA8KcY91qr
	wVpehnXe3JgI/H+dGvu2+s3qBQ/76q+BfuKnVQGKb++vkCWrhaimbC3avDjEYGJ1YedBIUYbFbm
	3C8M9Zf77sUA5JmxSkysNvt16efnLR6hhnkrlhR47j0ss5Tj2eX4f31PAu28OTe2be9ioA/qxEO
	Z5Qk0Urx4L8mxBhu7lzWZMHQRrJrHPzu84aw==
X-Gm-Gg: AYBFou1eCmafEsYZHy8WC70NzyTkcrtnuDU4dNAAc0T8/G4tBzD7hNdUJGcoAHHwrbo
	ecYoFgB4sCGocwVMSaEPrCxyMZ81MnVJosQltL98MbhWAxBHeA4sOvy0XjGIVCsu1AxIHFNTRz1
	FSfKvsnYirc2GbwTPt8UX74nIBgNvCAVNas6ad6NVRjVS6ZsG5UP+tevrjlL9+zWFNV6MyrTHhV
	csZXux428Qv/no4khhLgY7tFhvhhIQ8/83q/FRqxLe/ren7RmnBuHfiwxYmaRsbG4HwgqLn+n98
X-Received: by 2002:a05:620a:27c1:b0:93e:c12c:9b71 with SMTP id af79cd13be357-9494bd03e56mr1975575285a.76.1794920634750;
        Tue, 17 Nov 2026 05:03:54 -0800 (PST)
X-Received: by 2002:a05:620a:27c1:b0:93e:c12c:9b71 with SMTP id
 af79cd13be357-9494bd03e56mr1975567585a.76.1794920633951; Tue, 17 Nov 2026
 05:03:53 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794905977.git.zwq2226404116@163.com> <7a9617af129fac54b3a2575e39a006c57854142e.1794905977.git.zwq2226404116@163.com>
In-Reply-To: <7a9617af129fac54b3a2575e39a006c57854142e.1794905977.git.zwq2226404116@163.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:03:43 +0100
X-Gm-Features: AclHuK_HDpVH5z01rUZMFuJfiVt58vAHMQBA7hfg6V5RM69JEn4q2DTIa3B2MKM
Message-ID: <CAFEp6-3qmEu7CToPu6A9=DeVRSfTF0qmw2Ki+CYmJ4gvpzOVWw@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] bus: mhi: pci_generic: add Rolling Wireless
 RW135R-GL and RW151 support
To: Wanquan Zhong <zwq2226404116@163.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfX8olqKQBos6e3
 PGvU9U4f7ohmlsLrnqS7RH0OSAqMJnruBTkHCgbNO3f6dmxZtp6jA4h8w6iG64ccs8OxWEiVXg0
 2lVI7xwWy647rRbmPEunYPZWHZL82rA=
X-Proofpoint-ORIG-GUID: qXjqG_jhPuZDs18-l8dOG1SiQ4WwP3Kq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfX8xCUd/A7+Yry
 kTYMkCxJe/c0aZTLRpKYGUvlFcUwEoWB0rXCYZbvuQKvKMJRHWXaSQazappK8SNevquTzQESKzN
 1onYkEpL/a6/h9ZReoziJ2hFC9fkbT5Qj6MWFOXwYR8KCOMnTnK6EV5KPpKvg7/dUVKZyYQlFNz
 VYW6HdbiYrLnZwf5PZDj1VTbZody/5NyKbPbBiGQTF/Tbox7mK2uGtsm48YpjtUZXqB8MDjjC2L
 nODiT6YHmA2FFZcjMQ7/ZGSkaF448zE8eQvUE2WApiDf8myCh0lni5x1okFul914tASoKxAwRZc
 aFg93XXYZFvA47YdyLyU7pFDb1Jn6f5VGnaiqwj/F6w80sIYXKfJkJ9vOFGMjou1FcUHxBuSCi+
 Ka4xTFE96CUBheGHJRXsc9hbZNYz2q2JjVRrkYdyrQZ/fjuHBCsCEbmK8tt+PhCa8Wb015zZ7XO
 W/fHuXTaINdlmzs522Q==
X-Authority-Analysis: v=2.4 cv=K963jCWI c=1 sm=1 tr=0 ts=6afc50bc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=Byx-y9mGAAAA:8 a=1peLKHpgovxI-enXKA0A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: qXjqG_jhPuZDs18-l8dOG1SiQ4WwP3Kq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170051

On Tue, Nov 17, 2026 at 10:14=E2=80=AFAM Wanquan Zhong <zwq2226404116@163.c=
om> wrote:
>
> Add MHI PCIe device configuration for Rolling Wireless modules:
>
> - RW135R-GL (Qualcomm sdx35): SAHARA, DIAG, MBIM, DUN, FIREHOSE, ADB,
>   NMEA and IP_HW0
> - RW151 (Qualcomm sdx75): MBIM-based config for most SKUs
> - RW151 SP (2099:1502): QMI on channels 14/15 instead of MBIM
>
> Register PCI_DEVICE_SUB entries per chipset:
>
> - RW135R-GL on QCOM 0x011a (sdx35): sub-vendor 0x2099, sub-device
>   0x1300/0x1301
> - RW151 on QCOM 0x0309 (sdx75): sub-vendor 0x2099, sub-device
>   0x1500/0x1501/0x1502; HP OEM sub-vendor 0x103c, sub-device
>   0x8fb8/0x8fb4
>
> Use Rolling-specific EDL firmware paths under qcom/sdx35/rolling/ and
> qcom/sdx75/rolling/.
>
> Tested suspend-to-RAM (mem) on Rolling RW135R-GL and RW151 hardware: MHI
> resumes cleanly and MBIM/wwan function after wake. Hibernate (disk) could
> not be tested on this platform (/sys/power/state lacks "disk", ENODEV).
>
> Tested-on: Rolling RW135R-GL hardware (MHI probe, MBIM, DIAG, ADB,
> suspend-to-RAM)
> Tested-on: Rolling RW151 hardware (MHI probe, MBIM, DIAG, ADB,
> suspend-to-RAM)
>
> Signed-off-by: Wanquan Zhong <zwq2226404116@163.com>
> ---
> Changes in v7:
> - Standalone series on mhi-next (v6 not merged); includes full v6 content
> - Add mhi_rolling_rw151_sp_* for 2099:1502 (QMI instead of MBIM)
>
> Changes in v6:
> - Full RW135R/RW151 channel config and PCI IDs; no_m3 dropped; MBIM ring =
32
>
>  drivers/bus/mhi/host/pci_generic.c | 152 +++++++++++++++++++++++++++++
>  1 file changed, 152 insertions(+)
>
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pc=
i_generic.c
> index b636e2c23b4d..ce9a1205c2e9 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -948,6 +948,137 @@ static const struct mhi_pci_dev_info mhi_netprisma_=
fcun69_info =3D {
>         .sideband_wake =3D true,
>  };
>
> +static const struct mhi_channel_config mhi_rolling_rw135r_channels[] =3D=
 {
> +       MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(4, "DIAG", 64, 1),
> +       MHI_CHANNEL_CONFIG_DL(5, "DIAG", 64, 1),
> +       MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(36, "ADB", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(37, "ADB", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(60, "NMEA", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(61, "NMEA", 32, 0),
> +       MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 2),
> +       MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
> +};
> +
> +static struct mhi_event_config mhi_rolling_rw135r_events[] =3D {
> +       MHI_EVENT_CONFIG_CTRL(0, 128),
> +       MHI_EVENT_CONFIG_DATA(1, 128),
> +       MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> +       MHI_EVENT_CONFIG_HW_DATA(3, 2048, 101),
> +};
> +
> +static const struct mhi_controller_config modem_rolling_rw135r_config =
=3D {
> +       .max_channels =3D 128,
> +       .timeout_ms =3D 8000,
> +       .num_channels =3D ARRAY_SIZE(mhi_rolling_rw135r_channels),
> +       .ch_cfg =3D mhi_rolling_rw135r_channels,
> +       .num_events =3D ARRAY_SIZE(mhi_rolling_rw135r_events),
> +       .event_cfg =3D mhi_rolling_rw135r_events,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_rolling_rw135r_info =3D {
> +       .name =3D "rolling-rw135r",
> +       .edl =3D "qcom/sdx35/rolling/prog_firehose_ddr.elf",
> +       .config =3D &modem_rolling_rw135r_config,
> +       .bar_num =3D MHI_PCI_DEFAULT_BAR_NUM,
> +       .dma_data_width =3D 32,
> +       .mru_default =3D 32768,
> +       .sideband_wake =3D false,
> +       .edl_trigger =3D true,
> +};
> +
> +static const struct mhi_channel_config mhi_rolling_rw151_channels[] =3D =
{
> +       MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(4, "DIAG", 64, 1),
> +       MHI_CHANNEL_CONFIG_DL(5, "DIAG", 64, 1),
> +       MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(36, "ADB", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(37, "ADB", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(60, "NMEA", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(61, "NMEA", 32, 0),
> +       MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 2),
> +       MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
> +};

mhi_rolling_rw135r_channels[] and mhi_rolling_rw151_channels[] are
identical? why duplicating them? same for event configs.

> +
> +static const struct mhi_channel_config mhi_rolling_rw151_sp_channels[] =
=3D {
> +       MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(4, "DIAG", 64, 1),
> +       MHI_CHANNEL_CONFIG_DL(5, "DIAG", 64, 1),
> +       MHI_CHANNEL_CONFIG_UL(14, "QMI", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(15, "QMI", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(36, "ADB", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(37, "ADB", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(60, "NMEA", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(61, "NMEA", 32, 0),
> +       MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 2),
> +       MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
> +};
> +
> +static struct mhi_event_config mhi_rolling_rw151_events[] =3D {
> +       MHI_EVENT_CONFIG_CTRL(0, 128),
> +       MHI_EVENT_CONFIG_DATA(1, 128),
> +       MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> +       MHI_EVENT_CONFIG_HW_DATA(3, 2048, 101),
> +};
> +
> +static const struct mhi_controller_config modem_rolling_rw151_config =3D=
 {
> +       .max_channels =3D 128,
> +       .timeout_ms =3D 8000,
> +       .num_channels =3D ARRAY_SIZE(mhi_rolling_rw151_channels),
> +       .ch_cfg =3D mhi_rolling_rw151_channels,
> +       .num_events =3D ARRAY_SIZE(mhi_rolling_rw151_events),
> +       .event_cfg =3D mhi_rolling_rw151_events,
> +};
> +
> +static const struct mhi_controller_config modem_rolling_rw151_sp_config =
=3D {
> +       .max_channels =3D 128,
> +       .timeout_ms =3D 8000,
> +       .num_channels =3D ARRAY_SIZE(mhi_rolling_rw151_sp_channels),
> +       .ch_cfg =3D mhi_rolling_rw151_sp_channels,
> +       .num_events =3D ARRAY_SIZE(mhi_rolling_rw151_events),
> +       .event_cfg =3D mhi_rolling_rw151_events,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_rolling_rw151_info =3D {
> +       .name =3D "rolling-rw151",
> +       .edl =3D "qcom/sdx75/rolling/prog_firehose_lite.elf",
> +       .config =3D &modem_rolling_rw151_config,
> +       .bar_num =3D MHI_PCI_DEFAULT_BAR_NUM,
> +       .dma_data_width =3D 32,
> +       .mru_default =3D 32768,
> +       .sideband_wake =3D false,
> +       .edl_trigger =3D true,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_rolling_rw151_sp_info =3D {
> +       .name =3D "rolling-rw151",
> +       .edl =3D "qcom/sdx75/rolling/prog_firehose_lite.elf",
> +       .config =3D &modem_rolling_rw151_sp_config,
> +       .bar_num =3D MHI_PCI_DEFAULT_BAR_NUM,
> +       .dma_data_width =3D 32,
> +       .mru_default =3D 32768,
> +       .sideband_wake =3D false,
> +       .edl_trigger =3D true,
> +};
> +
>  /* Keep the list sorted based on the PID. New VID should be added as the=
 last entry */
>  static const struct pci_device_id mhi_pci_id_table[] =3D {
>         {PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0116),
> @@ -961,6 +1092,12 @@ static const struct pci_device_id mhi_pci_id_table[=
] =3D {
>         /* Telit FE912C04 (sdx35) */
>         { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x1c5d, 0x2045),
>                 .driver_data =3D (kernel_ulong_t) &mhi_telit_fe912c04_inf=
o },
> +       /* Rolling RW135R-GL (sdx35) */
> +       { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x2099, 0x1300),
> +               .driver_data =3D (kernel_ulong_t) &mhi_rolling_rw135r_inf=
o },
> +       /* Rolling RW135R-GL (sdx35) */
> +       { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x2099, 0x1301),
> +               .driver_data =3D (kernel_ulong_t) &mhi_rolling_rw135r_inf=
o },
>         { PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x011a),
>                 .driver_data =3D (kernel_ulong_t) &mhi_qcom_sdx35_info },
>         { PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
> @@ -995,6 +1132,21 @@ static const struct pci_device_id mhi_pci_id_table[=
] =3D {
>         /* Telit FE990B40 (sdx72) */
>         { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x1c5d, 0x2025),
>                 .driver_data =3D (kernel_ulong_t) &mhi_telit_fe990b40_inf=
o },
> +       /* Rolling RW151 (sdx75) */
> +       { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x2099, 0x1500),
> +               .driver_data =3D (kernel_ulong_t) &mhi_rolling_rw151_info=
 },
> +       /* Rolling RW151 (sdx75) */
> +       { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x2099, 0x1501),
> +               .driver_data =3D (kernel_ulong_t) &mhi_rolling_rw151_info=
 },
> +       /* Rolling RW151 (sdx75) */
> +       { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x2099, 0x1502),
> +               .driver_data =3D (kernel_ulong_t) &mhi_rolling_rw151_sp_i=
nfo },
> +       /* Rolling RW151 (sdx75) */
> +       { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x103c, 0x8fb8),
> +               .driver_data =3D (kernel_ulong_t) &mhi_rolling_rw151_info=
 },
> +       /* Rolling RW151 (sdx75) */
> +       { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x103c, 0x8fb4),
> +               .driver_data =3D (kernel_ulong_t) &mhi_rolling_rw151_info=
 },
>         { PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0309),
>                 .driver_data =3D (kernel_ulong_t) &mhi_qcom_sdx75_info },
>         /* QDU100, x100-DU */
> --
> 2.53.0
>
