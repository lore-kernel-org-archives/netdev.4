Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794815836;
	b=3XJrydBgnm3sYAbi7y6iYHWO9oOxyzW7/SFUm+WsSf2LvPmXjrN25gUQ/UY3ncgrhGOR
	 dTmrWw9rGITuJuuRmB0oyQQGRJYbDgv351mVnzE+YohnB6rijguXWhdSdS4MiRhqpTNhz
	 ddHzFDdtz9AgEdXW3CiCv3jQzf0lC9WyDSQWmjQlvhaFJxBJPgFTf2aGhdbrDknC+oRMR
	 gHNMuoiGrtTpEoznBpS7la7KQwOPt4kFzIuHjf0DdheBt5WAT08cXWG3vyUEdrmr9c68i
	 zGqxWDoI4yQNgfDjEfhgxUhX3U+ANX1Ptiw7joYBNeu4pi9XbIBHj+qLzS38bnIqKgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815836;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fj4cXt4NV451vKWkLMm3SnGNqAEB56Lh1g1FNy/XasM=;
	b=PlvRR8OCvOakIxYTRKQ6aZxN9500sXr47gH+SyZT6y1pPHrN6WjMEqzHM8Lmn7Vngjby
	 7dR2J8FOdTHrHXx/UqduYni3SAlLwkpS9CJIpApzsrUOX93FQNygNi0sKlJQ5E1VKQqq2
	 QEB/tevCigKqHhLAHAMmGZF4an3kkj9FAmZDQ99w5Lfa4ahyDdwAOIkd4aSzwHNLlKvqi
	 InCm66wNSE+JTGNCM3ztjINOESM2tAu+4kgEi/V5z4Z51PVyZv2ZefGnQja1UCQXpMH+p
	 cbXj4L4w5gUR3c5vySOesUnUiF0KNSVOOcNRRMeHSwnFBdXGPKP2ah5An41SM7RuP7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fzr2DNxW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b9Yn5LET;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F94606A329
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 07:57:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21F94606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fzr2DNxW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b9Yn5LET
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7ekI84149294
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 07:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fj4cXt4NV451vKWkLMm3SnGNqAEB56Lh1g1FNy/XasM=; b=fzr2DNxW4foWpXxT
	mvJjmDoPv67OLuzgqDV4/qpcFcqwILyumP4/MtYotkF80rAincOXzU3/FuX4UyNF
	LjxU4Z+jSMFnPPaOperiGD2rkUVsytoHK21sP5p50qSFbbcFyguRVuvU4j9ONfH6
	IEl+9EBMjH4jkBcoAMuuunJlJnCDWh8ib5psqUdlAxbDNFU0sODILeT50fE04jWo
	XmRjl1gNJqaajB2+9M8bzZt3bS6Thjoc0+C6aCcznXAEq8ThMr/InC5sL3KDM3oj
	ps0zyAV7R/HvYmC7HMu3ul//K9zU6GFzmd+QVhTMiR7rjblu894eW90BpgF0NIUC
	YHgxrg==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmhncrr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 07:57:15 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-67dbb53a803so926746d50.0
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 23:57:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794815834; cv=none;
        d=google.com; s=arc-20260327;
        b=n6GZ3iAmMXywQ0rfeHSkSwxBVqo5gkX6qb21q4O2dk+h52l9fKxUnLVShGu41A2N+P
         7Iqr8fyoh1dmAQaKok0odhwuF1Epgdn62tabCcdGY1nxjh83thGYepbuZbETODbDwxMP
         VBsKLo5nqQJnoUXQiUrjnwGILVBMN/kRQA+XWl6JMCS+F7vLdph4XFc+tQ8yIJuAK+Kt
         U5ZF29fYp2DfY/41tkIvdAgRCEfmnmE7Z4F1LZZfLa6QpnVfpAG52lt+C4bSwbtSHHJp
         R1BqtmlkPisC7alJhOF1UHmOZHGq7N5HApU+A7ROcqeqp0Yh5XsG5wMgu0mmnJL/h1aA
         uRzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fj4cXt4NV451vKWkLMm3SnGNqAEB56Lh1g1FNy/XasM=;
        fh=7y1yZ9Fd6QJ4rxuCbAZkRhJq/5IEeh7dtwrDH4fd1yM=;
        b=ViedaKk08itEz1gGax6tzB0PXtV7zgJAGRzTVSBhxxWK66H+0DylNkL/a+PoNbUfpU
         kgmGJsvr1RCdd8S4uvQRjDxh71QpyYuxq3YEseYl+y69SYWrJFRNYEH+vAzKf28+DwRf
         05W94Il2KW1Sv2x6f5KZc1v8H9LupqcsuvB7VnS2WCY6dVkEujysw6ztLXlTZCNpVqvc
         X53AdDVkajSIRJuEAJCkGh9a9e8qjNfQ1FcedaM53LOJgNBAeGhaCWvwCQmK2x7VJyDg
         xD/FuxvZcDDWRgTVOhyB4nHzGtnkhlttlC+C09pMgnALAAjnJ+DxEkRIaqhPzbYdfLpj
         Z/HQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794815834; x=1795420634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fj4cXt4NV451vKWkLMm3SnGNqAEB56Lh1g1FNy/XasM=;
        b=b9Yn5LETPV+l840iMJ4mVHGn7R3QKOmlpKIna6ciyepZO/JMkHNtQOjx6E6MJSwBAN
         6j/nwKySLpta/au1FBk3/xlPz67KeZh/TLEpHBr9TlgwTuNWCRPnbuZUNV1k579xPsrN
         NflD8grO2Q8FfYL9Af4Bc3SZZ7pCC0lxHcR/2O0gY4sXcxF4LDmgT8n0VulJ9xd1rE4B
         yrQXx6azRW1DJmx7xekFtkGv9XzQHH9ZhDCW3nEA33rQSSfRgb0KR6w7IZd3PpEg3c9K
         8OXGVfZ+NwNP5089JQW4X9OgAXAXrH+0ovV+QPWG59uvbXyp5pgVnQH69QR4P/Fj/8pD
         P/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815834; x=1795420634;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fj4cXt4NV451vKWkLMm3SnGNqAEB56Lh1g1FNy/XasM=;
        b=Yp68rOPVD1aaKX2Y3aMBzQvj3pWhA3fpX0s1HD1OPmvJjvjDRMWwiLD2A/nQgqK9cI
         taYq6owr/Kx8KOxYjXz9rgUK6/nqDGwoC4aLB25MyfXcjbfUi6BiSQ3DJPkQEsv679JN
         +i32S/4zGVTtLiVpSicaltwO6mbkBsIvhuELUpaRqFjzvF5nSA0dWJFDXXUKbALi2QZI
         1DlZKAgJEM1cuDMQL/WPg/WE79B1P0ntQPMDja5Rnz+j37pBa8+M/SW1wkPX03VTQpfM
         SJvPrdjG7C+YoHIcG0RsKm0e74cReQttGkhhIVk6Z6aII4RaUPfwJ9uq18fR/CClJ+Rb
         7hrA==
X-Forwarded-Encrypted: i=1; AL+hErHY4N9/ThG40QI/F5VuIXtCczLBPVL8B5Dt5atFobBeG0SlBhpUrV2IG+FlAwESj61AEJbjwZw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uWC61/V7N2GOwpMg1fGgRTXHnJyEcZQdP4ky2O/L7yvsrl87x
	CixLPwZHfBCFXhhp9LxdqLiJg2V3sTaONCO63/SS0aac6P72yiXKLElmLy2lVOq4Bl+5j1Z4+Cn
	FAjfrPbSGmVcB4H9O5cWET0RdNPERDorpyIadIruw1iC7oQbq7Mlqc5ZVersrTon3zpKn8Z5KfA
	FB4w/Gjg4j+ktzHCdb7mBk51dVK+MNPPlBuQ==
X-Gm-Gg: AZFdTZd3yRCXWbqyI0XprEO5TXALnHTrjuAq11BDisyzaLlwADXa544ICT6foPe9qW1
	IeZZZD0MQfKFYf/XoMh55YKD+/vm9IBrCPrXE2iqoli6x3inN+2UqSq9WdZqSiGRRYZB6JdC+2z
	0jtqexmsrE+9169mVMQMLF3F6FYWjhjMbQGpENVCMAvZyHxAxM5z3qQPdDZg==
X-Received: by 2002:a05:690e:1447:b0:67c:11c9:2d10 with SMTP id 956f58d0204a3-67d89828203mr7158998d50.89.1794815834204;
        Sun, 15 Nov 2026 23:57:14 -0800 (PST)
X-Received: by 2002:a05:690e:1447:b0:67c:11c9:2d10 with SMTP id
 956f58d0204a3-67d89828203mr7158980d50.89.1794815833698; Sun, 15 Nov 2026
 23:57:13 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-aquantia-poll-global-status-register-v2-1-b602fc7e80a9@oss.qualcomm.com>
 <179473078423.2199510.11398825136938509686@kernel.org>
In-Reply-To: <179473078423.2199510.11398825136938509686@kernel.org>
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 15:57:02 +0800
X-Gm-Features: Aa3M54o6qBBA3V0s4UT_4BqHaeqEpI5eO_2r1FclneHZIMg_LaRtxtOzEjW4olQ
Message-ID: <CAPTcHHTdwtfhQkuOMw=HvnMB+HRRKGH-7T=Oou=zaFj+Zm9ApA@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: phy: aquantia: Poll global status
 register for provision ID
To: netdev-bot+sashiko@kernel.org
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, sagar.cheluvegowda@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: GoZzZ0Lk4oFeIqarAOz8DewQh-vf6m0y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzMSBTYWx0ZWRfXw4XSspCYvcvk
 74TWyngWM2zDgl3UeRGtPoiwSuDok4NAuHAJh/cobbriyegIEAfiCw1F+Kadf3+0/ObW96KnjCk
 SxVAqJzo/3C6vFurWlSnuk/jFLsWUCM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzMSBTYWx0ZWRfX3/VJ7flar5tZ
 aYSN8u2N4YDM2k9iAjLnCnXq26afvD9nQhqzVaBC323Cc8YUv41INvhlDzJa3lAn6fIaQWOWBHN
 T/l0tXtnTdMU2zEZbBlFI5nON2lWQIhiDKAmjaT7qL+05McBsAmwhQRk0aQ2usJq2WZ39wt7AtO
 XTJK1F59pb+Gclt6JRv1Q3C1wbmK/UZ68rxQXqfaNjA1ektKBF26+uMcLKoizmXFEMIhYKmhqFp
 tftJgNQ6IuBydoMPb63Nu9E8eWAoiZ5rAabOwBNh3D9zT79EkZ9jXhH5Zd917ZUQQM7jaSaS2Wl
 ZHlPEYsQPkcpN7+8z9k7cIYQJKgOZoEnrtnFkoclcELwenH7gbpQCCrfn7tG3ox+Fukt3uFMgpQ
 li7RvptDO9rI1ZMBM+5+1eAwol7wb8QZX3FzVay5f5VDwKPQsJWTyrttuhEFEzg/msaOpIdjX2M
 wrrUXbqwst6mWkubqzQ==
X-Authority-Analysis: v=2.4 cv=e/2T2qp/ c=1 sm=1 tr=0 ts=6afab75b cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=9R54UkLUAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=xwKONjL-6CjfJ1EiobAA:9 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-ORIG-GUID: GoZzZ0Lk4oFeIqarAOz8DewQh-vf6m0y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160031

On Sun, Nov 15, 2026 at 4:19=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 5 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 2 =C2=B7 Low: 3
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] In aqr_wait_reset_complete()
>   (drivers/net/phy/aquantia/aquantia_main.c:708-721), the new second=E2=
=80=A6
> - [Medium] net: phy: aquantia: propagate MDIO read error in
>   aqr_wait_reset_complete()
> - [Low] The comment above aqr_wait_reset_complete()
>   (aquantia_main.c:684-690) was not updated.
> - [Low] On a provisioning-ID timeout, aqr_wait_reset_complete()
>   (aquantia_main.c:717-719) prints 'Firmware provisioning ID not ready;=
=E2=80=A6
> - [Low] net: phy: aquantia: missing Fixes trailer for
>   aqr_wait_reset_complete() fix
>
> --
>
> net: phy: aquantia: Poll global status register for provision ID
>
> This commit adds a second poll to aqr_wait_reset_complete(). Once the
> firmware ID shows up, the poll waits for the provisioning ID field in
> VEND1_GLOBAL_RSVD_STAT1 to become non-zero. If the poll times out, it
> logs a warning and the function still returns 0. The stated reasons
> are link failures seen on AQR113 and correct fingerprinting of AQR412C
> MUSX firmware.
>
> > diff --git a/drivers/net/phy/aquantia/aquantia_main.c b/drivers/net/phy=
/aquantia/aquantia_main.c
> > index e95d391a6dc23..bed891cfaaa1b 100644
> > --- a/drivers/net/phy/aquantia/aquantia_main.c
> > +++ b/drivers/net/phy/aquantia/aquantia_main.c
> > @@ -702,7 +702,23 @@ int aqr_wait_reset_complete(struct phy_device *phy=
dev)
> >               return val;
> >       }
> >
> > -     return ret;
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D read_poll_timeout(phy_read_mmd, val,
> > +                             val < 0 ||
> > +                             FIELD_GET(VEND1_GLOBAL_RSVD_STAT1_PROV_ID=
, val),
> > +                             AQR_FW_WAIT_SLEEP_US, AQR_FW_WAIT_TIMEOUT=
_US,
> > +                             false, phydev, MDIO_MMD_VEND1,
> > +                             VEND1_GLOBAL_RSVD_STAT1);
>
> [Severity: Low]
> The commit message describes two problems: link failures seen during
> AQR113 bring-up, and an AQR412C MUSX fingerprint that can't be built
> correctly. Both come from aqr_wait_reset_complete() treating a
> non-zero VEND1_GLOBAL_FW_ID as the end of chip initialization, before
> the provisioning ID in VEND1_GLOBAL_RSVD_STAT1 is set.
>
> If this is meant as a bug fix, should it carry a Fixes tag? The
> FW_ID-only poll appears to go back to commit 43429a0353af ("net: phy:
> aquantia: report PHY details like firmware version"). That commit
> added aqr107_wait_reset_complete(), which was later renamed to
> aqr_wait_reset_complete().
>
This is not a bug fix, it is an additional check for PHYs who need the
polling of provision ID like AQR113C.
So I think it can not be treated as a direct fix the commit 43429a0353af.

> Without the tag, stable maintainers and backporters have no easy way
> to tell that this change addresses a problem in released kernels. And
> if it is a fix, should it go to net rather than net-next?
it should go to net-next.

>
> [Severity: Medium]
> This poll only exits on a non-zero PROV_ID or a read error. If a
> firmware image reports PROV_ID =3D=3D 0, will every call sleep the full
> AQR_FW_WAIT_TIMEOUT_US (2 s) and then return 0 anyway?
>
> The commit message says "not all PHYs require a valid provision ID",
> which suggests PROV_ID can stay 0 on some images.
>
> In the driver, prov_id only matters for one fingerprint:
>
>   AQR_G3_V4_3_C_AQR_NXP_SPF_30841_MUSX_ID40019_VER1198
>       AQR_FW_FINGERPRINT(4, 3, 0xc, 1, 40019, 1198)
>
> That fingerprint is only checked for PHY_ID_AQR412C, in
> aqr_translate_interface().
>
> aqr_wait_reset_complete() has two callers, and both now pay for this
> wait:
>
>   aqr107_probe()
>     aqr_firmware_load()
>       aqr_wait_reset_complete()
>
>   phy_attach_direct() / mdio_bus_phy_resume()
>     phy_init_hw()
>       aqr_gen1_config_init()
>         aqr_wait_reset_complete()
>
> With such an image, would each port lose about 4 s across probe and
> attach, and then 2 s plus a warning on every later attach and resume?
> On quad-port parts like AQR412/AQR412C, that cost applies to each port.
>
> Before this patch, both paths returned as soon as FW_ID was non-zero.
> Could the PROV_ID wait be limited to the PHYs or firmware images that
> need it?
This makes sense, for PHYs with prov_id=3D0 as valid, the probe will be
bcloked for fixed 2s, this is not acceptable.
Yes, need to limit the change to PHYs who really need the non-zero
PROV_ID. Will change this to limit to only AQR113/AQR113C,
and leave AQR412 logic untouched.
>
> > +     if (val < 0)
> > +             phydev_warn(phydev, "Failed to read VEND1_GLOBAL_RSVD_STA=
T1: %pe\n",
> > +                         ERR_PTR(val));
> > +     else if (ret)
> > +             phydev_warn(phydev, "Firmware provisioning ID not ready; =
"
> > +                         "interface mode detection may be incorrect\n"=
);
>
> [Severity: Medium]
> If phy_read_mmd() fails while polling VEND1_GLOBAL_RSVD_STAT1, the
> val < 0 term ends read_poll_timeout() right away with ret =3D=3D 0. The
> code then logs a warning and returns 0, so the MDIO error is lost.
>
> The VEND1_GLOBAL_FW_ID poll just above handles the same case with
> phydev_err() and returns val. Is it intended that a read error here
> is non-fatal? The commit message only says that the timeout case
> should not fail probe.
>
> Both callers act on the return value:
>
>   aqr107_probe()
>     aqr_firmware_load()
>       aqr_wait_reset_complete()
>
> aqr_firmware_load() treats 0 as "Some firmware is loaded =3D> do
> nothing". Any other negative value goes to the default branch, which
> passes the PHY read error back to aqr107_probe(). With this change, an
> MDIO failure on RSVD_STAT1 looks like ready firmware, and probe goes
> on.
>
>   phy_init_hw()
>     aqr_gen1_config_init()
>       aqr_wait_reset_complete()
>
> aqr_gen1_config_init() only builds the fingerprint when the return
> value is 0. After a read error it now goes on to
> aqr_build_fingerprint() and the rest of the PHY configuration, even
> though the provisioning ID was never seen.
>
> Could the val < 0 case return val, the same way the FW_ID poll does,
> and leave only the timeout as a warning?
>
with the above proposed change, we can safely change the warning to err now=
.
This is not a concern anymore then.

> [Severity: Low]
> This warning can fire on every model that uses aqr107_probe() and
> aqr_gen1_config_init(), such as AQR105, AQR107, AQCS109, AQR111,
> AQR112, AQR113, AQR114C, AQR115 and AQR813. Is "interface mode
> detection may be incorrect" accurate for those?
>
> The provisioning ID only affects the interface mode in
> aqr_translate_interface():
>
>         if (phy_id_compare(phydev->drv->phy_id, PHY_ID_AQR412C, phydev->d=
rv->phy_id_mask) &&
>             priv->fingerprint =3D=3D AQR_G3_V4_3_C_AQR_NXP_SPF_30841_MUSX=
_ID40019_VER1198 &&
>             interface =3D=3D PHY_INTERFACE_MODE_USXGMII)
>                 return PHY_INTERFACE_MODE_10G_QXGMII;
>
> So on other models, a missing provisioning ID can't cause wrong
> interface detection.
>
> The message also doesn't mention the link failures that the commit
> message describes for AQR113.
>
> > +
> > +     return 0;
> >  }
>
with the above proposed change, (limit the PROV_ID polling only to
AQR113), this issue will be fixed together.

> [Severity: Low]
> This isn't a bug, but the comment above aqr_wait_reset_complete() was
> not updated:
>
> /* If we configure settings whilst firmware is still initializing the chi=
p,
>  * then these settings may be overwritten. Therefore make sure chip
>  * initialization has completed. Use presence of the firmware ID as
>  * indicator for initialization having completed.
>  * The chip also provides a "reset completed" bit, but it's cleared after
>  * read. Therefore function would time out if called again.
>  */
>
> It still names FW_ID as the only sign that initialization is complete.
> It doesn't mention the second, non-fatal wait on the provisioning ID.
>
> Also, on PHYs where PROV_ID stays 0, every call from
> aqr_firmware_load() and aqr_gen1_config_init() now times out again.
> Isn't that the repeated-call timeout this comment says the design
> avoids?
>
> Could the comment be updated to match the new behavior?
Will update comment accordingly.
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261111-aquantia-poll-global-status-register-v2-1-b602fc7e80a9%40oss.q=
ualcomm.com

pw-bot: cr

Regards,
Hongmei Xu
