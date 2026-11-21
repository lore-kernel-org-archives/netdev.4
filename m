Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795276270;
	b=eKgsLHfDS49u07ZhT3Lo+c3f7jmH+l/5FKrBqHmQNDKbrmMRS/WuQYse6686RQXO0xWj
	 Q2XE5b4yu1HM4cVUxetMcJs2IoPkk1JLcxs82f+uAL/lUy9REeNKFqKMgkYZ2+v2eJfDg
	 t6Y6pd8McXasVCyBSTUoianrZ3QiMNYKUIxQaxOKcS0o1XBlbQ/wZrPDYPI4ck4Vq9CJ3
	 HD5InsfFGQV47HbTpJ7ZkmD8X4NK7QY5fgaUkSueFB+kXom0vvd1X7TQ8HCliiVNxIKT7
	 XnohZlZRzWgWWMpt7HamVe8cPIftfcVywGjgFprqi/m1cwSdxlmMlfc2FRuonFZetVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795276270;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 References:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:Thread-Index:
	 Content-Language:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WA8K5eTeIweFP8s3e1UACTpLtDJdZwazBFPNVjFuA7k=;
	b=Si2RYzYME3NNvTrOMxJXcXgYB8I8NlFi8vsxuatPNmEl13tqLiCH11lsift6gt0u2sLT
	 jyxAfVdl9ZOgVfdGtgASNu6ZQ716XP7ijc4V8OOw8z7g6aqwWxAyMt9Q3FV17SWhBOyhp
	 o+QeeMs4oi+wTEhCyGiJ8JMZoS1OVT+jhsJSQfMINyEagotPPrjijJIWDvcT3r2tix37O
	 DcDb89CLFJSISTlbI5BxDkjPLv3ImkgZP/rMBjH70Ok1Mdx9dm7Oc3LjeS0fI+6xJy6P8
	 0QtUY6DaHPG/UniFekQe8bW1ZphuxVtizcI7d2wVRMPPJzlviY09A0OxwO2XJ3aTudA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oB0e5cK4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JHceUiVA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11498606A330
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 15:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11498606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oB0e5cK4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JHceUiVA
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ALFa4dB977812
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 15:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WA8K5eTeIweFP8s3e1UACTpLtDJdZwazBFPNVjFuA7k=; b=oB0e5cK4oPmaVVn3
	U6ejYEl+rDgADtXfD1sduDs1LwYN4oB5NDOGK3eLAIVAWy7M03Z1B6H2HZfaaY6T
	1cgH7X0DMwT0DRfdEQOCRd9E3f0SyP3epGV2SGTlUXX39HpjojY/1g+NQtDt27Jt
	Mpnbc87hZNDgTL31NknIhycwlX9XTc37dArN1LXAbSjc+tyAZAUoSev1ufewxLKT
	ogVfhmn6HzDvc3Yxsz3q315DBAYwkUQG3GNKR4oD8FxY/kTaAOLgP8Qr4e5K3aU7
	EY2it9ZGfOPtOi7mi+DhwSCO8wjBxwBFeyXOJRO03u03uYnF5YwIz56ZM3xx8Wn1
	bs3NnA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33cu1et3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 15:51:07 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3846d5f54c1so2449315eec.1
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 07:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795276267; x=1795881067; darn=vger.kernel.org;
        h=content-language:thread-index:content-transfer-encoding
         :content-type:mime-version:message-id:date:subject:in-reply-to
         :references:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WA8K5eTeIweFP8s3e1UACTpLtDJdZwazBFPNVjFuA7k=;
        b=JHceUiVAjBUszZcgvZWq5Cd2sXaSNq5iMPIESfgjPARaH2QevnqQva0CHVK4Fr1GBw
         40b5T+XoFXwuG/0Ok+riwkhkdTp9YYWP8BZ4PtmOFJ5qudrHM8R62BNXuVMCNDbVg6Ip
         C+q5KsV5nMeLfyjMdY4WDHC9tMYgw0ppf8KeyskCvoUwdg6LaMwBLF0BWynBtwhfSiGQ
         T2bkygwvmIHMtFGcE9FQuafDvoLUeVJpAme49YLKTxzxkL/TxSUhUkiZ644uKnJdyFGB
         amtDoF3w0Xr1kbUnMH7UkDkCEe9GgrCbz2M/6SKv1KKz0exA9JwYZtImiSQ/Pw63zKV1
         8v1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795276267; x=1795881067;
        h=content-language:thread-index:content-transfer-encoding
         :content-type:mime-version:message-id:date:subject:in-reply-to
         :references:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WA8K5eTeIweFP8s3e1UACTpLtDJdZwazBFPNVjFuA7k=;
        b=Rc9uTC5h7aA6qZc6phYhizt0Hr8V/4dFdNB+wioHUqTdhYNCpGrFjXERhHtt3GZkO+
         8knze28wLTTkINURx2vFH6vDibpwytz3wl9EHoPRFoZsd4a6m/b8O4Vo9wYPyj1nvPY4
         PnKurg1fDwZlJntKgg13vuyDLtMNbu1p5Dxedrm92iszmRZs85K61HzkPfA09E27GRJL
         y1vFT9mQ3zPbcLTBwcGvylULKrvRWfTOwbUPmnSX/jKeTNCDFPCp29SsflTZUNJ/O5pA
         7rCwnZIzvZwFv/9rgoBhg/5/yzg1LVw4lJiLtvOBHs3sNIn5SgCd21yykbZVHjUsSIBc
         +9RA==
X-Forwarded-Encrypted: i=1; AL+hErEWWsy5USl4gWOkKCpVAC2tloFanyhXfKQhRRo5cEdbM+UNM/1xekAKjYBTDdD50VzxazBOs/8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9N8euol6hmlOgjODgNfSiqFLMgKeWofr4eiOA+fMGkBwpQi0XO
	eH/GJ2b1w+o+jr228Xjep7ZOc5cgLZiFpTtB+9UHFISex/pv8+9v+IXM3QvUiisTmQNhqMXEfos
	M++I6enTKoTSqOW0ynTgvmBwOOpDoBzAjpWg4s+qb7NV/mrFSmCO1+6G3P1U=
X-Gm-Gg: AZFdTZd4X2H0YI52LaYRM6EThNt6M+Bp5l++j0svDeEzU2trMOnQlxrcpjR28cfC9cr
	sWLEhD0qdjVWg7sj9YwoojQE1zVuhdKpkA7rDc+Apum50F5NStMWfc+uJmTuVDyDo7DwSm2ybcd
	nGL2IKxQwbOwGFBt3tec9Yb/mePBVvo2YaRG6hJM+Jl8ZlbAC1OaFICUhxLq/m/FgS/NgB7+a/S
	9fBNFQvGYHZIZBn+kV9D+ds+qO6mtCYfJtEvFID9TndraZObvF0C0WAI3hhz8WWSPd2TkQNgk7E
	KdYpDuvJygk6+l1DwfT9eE4Aaq93O8hd35GEcdnebkdTGw79LtVELn5LL7wmXfkHI43r4JUup84
	BjVBs3SUNfdzZoTHrXIQ4VYXmdG9rSR3b8ZO4aoeKDU/wQeEgHREiLI2IGpPl8ENJKDA0Qdg9mU
	Eym/wYRdFsNM+tyJ+bx3ZuxMcxS8vMM9RV46y8rtAKPyI53l4L59J//TEyFg==
X-Received: by 2002:a05:7301:4d18:b0:37d:bd4e:c378 with SMTP id 5a478bee46e88-3857181d8ddmr6249965eec.41.1795276266723;
        Sat, 21 Nov 2026 07:51:06 -0800 (PST)
X-Received: by 2002:a05:7301:4d18:b0:37d:bd4e:c378 with SMTP id 5a478bee46e88-3857181d8ddmr6249945eec.41.1795276266173;
        Sat, 21 Nov 2026 07:51:06 -0800 (PST)
Received: from QCOMk1gASIiYhG (66-33-8-210.colorado.intrepidfiber.us. [66.33.8.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm20604353eec.27.2026.11.21.07.51.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 21 Nov 2026 07:51:05 -0800 (PST)
From: <subash.a.kasiviswanathan@oss.qualcomm.com>
To: <netdev-bot+sashiko@kernel.org>
Cc: <sean.tranchetti@oss.qualcomm.com>, <andrew+netdev@lunn.ch>,
        <davem@davemloft.net>, <edumazet@kernel.org>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <netdev@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20261117060737.2764327-6-subash.a.kasiviswanathan@oss.qualcomm.com> <179524464443.3135.11939584752095940965@kernel.org>
In-Reply-To: <179524464443.3135.11939584752095940965@kernel.org>
Subject: RE: [PATCH net v5 5/5] net: qualcomm: rmnet: Resize endpoints with dev_set_mtu() and restore on failure
Date: Sat, 21 Nov 2026 08:51:04 -0700
Message-ID: <000101dd79d0$1e2a73c0$5a7f5b40$@oss.qualcomm.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQINMJy3lKvxuvNgiMIx7+eObMjZYAIHDEEOtskFHYA=
Content-Language: en-us
X-Proofpoint-GUID: bmXB6adEVbORADGHgxkngWI-9zUsK2F8
X-Proofpoint-ORIG-GUID: bmXB6adEVbORADGHgxkngWI-9zUsK2F8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDA2MyBTYWx0ZWRfXzDo8kDqXi8yI
 bjTh2PyXRC0aKZ+dcPV8RVbeU6hB4tH87Y+AB25BrKqfIH3+TZ952UkaBGIy5Iudfjjt9BIBUF+
 BsL0ggJh2LBh2m3IOzm9rJHXAEpzLRQ/JrX84FUxHQgYozKGGxKzmWMew/QHjGv7pPLI4GEe2Kq
 Hi1RxlhRXaytpOPBgs71y1dLW1Z+/+zxO+9M9QVJv3WZxn12t0GmBmCeNm2xcZKwYL2FB0eFXon
 jYSOQmvA8TDxgRgvnuDspKnnbKCepZVApcaHy96YnY82wxnC2lg/KUC4Dkmk6gmZfzyQwv5jWqM
 wf/kkgK8eSQ2CcZmYCPeW3NJGoQOJ91qHgKWMmrcygye0/zITTUjLSGpAUqvQ5SmlYyhIKdI5XR
 7LpXPMgv/X5/rsP9PaP3XlzccvY7zAFbuckWZ3i7CFGHgWt9rx8qfqmPb+ZHxiFQwXQA//dvO83
 kJwlax6ElWXpOHNWrlg==
X-Authority-Analysis: v=2.4 cv=MM71C8Zl c=1 sm=1 tr=0 ts=6b01bdeb cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=OltkOWFNRHEXGe+8VJKHzA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=J1Y8HTJGAAAA:8 a=20KFwNOVAAAA:8
 a=pdht-NoODuSLnQW0akAA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
 a=y1Q9-5lHfBjTkpIzbSAN:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDA2MyBTYWx0ZWRfX2uuw3j7lcYiE
 jv0Mr/7RV95EbPezPBbDEGGWlpNjy1YMhdNYtKlRGI6vegTI/2Iin3vb+hjTUbJSCRTMnEMlnlP
 iOupZJX2/usX39FiGz3v4KIAiCFeRMs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611210063

> -----Original Message-----
> From: netdev-bot+sashiko@kernel.org <netdev-bot+sashiko@kernel.org>
> Sent: Saturday, November 21, 2026 12:04 AM
> To: subash.a.kasiviswanathan@oss.qualcomm.com
> Cc: sean.tranchetti@oss.qualcomm.com; andrew+netdev@lunn.ch;
> davem@davemloft.net; edumazet@kernel.org; kuba@kernel.org;
> pabeni@redhat.com; netdev@vger.kernel.org; =
linux-kernel@vger.kernel.org
> Subject: Re: [PATCH net v5 5/5] net: qualcomm: rmnet: Resize endpoints =
with
> dev_set_mtu() and restore on failure
>=20
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>=20
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>=20
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let =
patchwork
> know by including "pw-bot: cr" as a separate line at the end of your =
reply
> (one such reply per series is enough).
>=20
> - [Medium] rmnet_vnd_update_dev_mtu()
>   (drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c:447-473) now
> shrinks=E2=80=A6
> - [Low] The commit message opens with "When the real device MTU or the
>   data format requires a smaller MTU, existing endpoints are shrunk =
by=E2=80=A6
>=20
> --
>=20
> net: qualcomm: rmnet: Resize endpoints with dev_set_mtu() and restore =
on
> failure
>=20
> This commit changes rmnet_vnd_update_dev_mtu() so it shrinks existing
> endpoints with dev_set_mtu() instead of calling the ndo directly. As a
> result, MTU notifiers and link notifications are now delivered. If =
resizing
> an endpoint fails, the endpoints already resized are put back to their
> saved MTU, and the original error is returned.
>=20
> > When the real device MTU or the data format requires a smaller MTU,
> > existing endpoints are shrunk by writing dev->mtu directly. No MTU
> > notifiers run and userspace gets no link notification.
>=20
> [Severity: Low]
> Is the part about the real device MTU accurate?
>=20
> rmnet_vnd_update_dev_mtu() has only two callers, rmnet_newlink() and
> rmnet_changelink(). The changelink call only happens when
> IFLA_RMNET_FLAGS
> is present, which means a data format change.
>=20
> When the real device MTU changes, rmnet_config_notify_cb() only =
validates
> the new value and vetoes it if needed:
>=20
> =
drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c:rmnet_config_notify_
> cb() {
>     ...
> 	case NETDEV_CHANGEMTU:
> 		if (rmnet_vnd_validate_real_dev_mtu(real_dev))
> 			return NOTIFY_BAD;
>     ...
> }
>=20
> So endpoints are never shrunk on that path, either before or after =
this
> patch.
>=20
> Could the commit message be limited to the data format case? As =
written,
> it suggests this fix also covers the real device MTU path.
>=20
> > diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
> b/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
> > index 8bf87c5ecb43b..dce436e4c6305 100644
> > --- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
> > +++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_vnd.c
> > @@ -433,24 +433,42 @@ int rmnet_vnd_validate_real_dev_mtu(struct
> net_device *real_dev)
>=20
> [ ... ]
>=20
> >  	hash_for_each_safe(port->muxed_ep, bkt_ep, tmp_ep, ep, hlnode) {
> > -		if (ep->egress_dev->mtu <=3D new_mtu)
> > +		ep->saved_mtu =3D ep->egress_dev->mtu;
> > +		if (ep->saved_mtu <=3D new_mtu)
> >  			continue;
> >
> > -		err =3D rmnet_vnd_change_mtu(ep->egress_dev, new_mtu);
> > -		if (err)
> > -			return err;
> > +		err =3D dev_set_mtu(ep->egress_dev, new_mtu);
> > +		if (err) {
> > +			fail_ep =3D ep;
> > +			break;
> > +		}
> >  	}
> >
> > -	return 0;
> > +	if (!err)
> > +		return 0;
> > +
> > +	/* Restore the endpoints which were already resized. Failures here
> > +	 * are ignored since the original error is the one to report.
> > +	 */
> > +	hash_for_each_safe(port->muxed_ep, bkt_ep, tmp_ep, ep, hlnode) {
> > +		if (ep =3D=3D fail_ep)
> > +			break;
> > +
> > +		if (ep->egress_dev->mtu !=3D ep->saved_mtu)
> > +			dev_set_mtu(ep->egress_dev, ep->saved_mtu);
>=20
> [Severity: Medium]
> Does this restore undo everything the earlier dev_set_mtu() calls did?
>=20
> Now that the shrink goes through dev_set_mtu(), netif_set_mtu_ext() =
runs
> the NETDEV_PRECHANGEMTU and NETDEV_CHANGEMTU notifier chains for
> each
> endpoint.
>=20
> A PRECHANGEMTU notifier can now veto the shrink. For example,
> team_device_event() does this:
>=20
> drivers/net/team/team_core.c:team_device_event() {
>     ...
> 	case NETDEV_PRECHANGEMTU:
> 		/* Forbid to change mtu of underlaying device */
> 		if (!port->team->port_mtu_change_allowed)
> 			return NOTIFY_BAD;
>     ...
> }
>=20
> Before this patch, the direct rmnet_vnd_change_mtu() call could not =
fail
> here, because new_mtu < ep mtu <=3D real_dev->mtu - old headroom. So a
> newlink or changelink with IFLA_RMNET_FLAGS that used to succeed can =
now
> return an error.
>=20
> If the veto happens on a later endpoint, the CHANGEMTU notifiers have
> already run on the earlier ones. If the temporary new_mtu was below
> IPV6_MIN_MTU, addrconf_notify() tore down IPv6 on those endpoints:
>=20
> net/ipv6/addrconf.c:addrconf_notify() {
>     ...
> 	case NETDEV_CHANGEMTU:
> 		/* if MTU under IPV6_MIN_MTU stop IPv6 on this interface.
> */
> 		if (dev->mtu < IPV6_MIN_MTU) {
> 			addrconf_ifdown(dev, dev !=3D net->loopback_dev);
> 			break;
> 		}
>     ...
> }
>=20
> In the same way, inetdev_event() falls through to inetdev_destroy() =
when
> the MTU is below the IPv4 minimum.
>=20
> Restoring saved_mtu only creates a new, empty inet6_dev or in_device. =
The
> configured addresses, routes and per-device sysctls are still lost, =
even
> though the request returned an error.
>=20
> For example, take a real_dev MTU of 1284 with no checksum offload (4 =
bytes
> of headroom). Endpoint A has a lower mux_id, has IPv6 configured and =
is at
> 1280. Endpoint B has a higher mux_id, is a team port and is also at =
1280. A
> changelink that sets CKSUMV5 (8 bytes of headroom) gives new_mtu =3D =
1276:
>=20
>   dev_set_mtu(A, 1276)  -> addrconf_ifdown(A, true)
>   dev_set_mtu(B, 1276)  -> vetoed by team_device_event(), -EPERM
>   dev_set_mtu(A, 1280)  -> A comes back with no IPv6 addresses
>=20
> Userspace also gets a shrink-then-grow pair of RTM_NEWLINK events for =
A,
> for a request that failed.
>=20
> The commit message says a failed request "does not leave some of them
> shrunk". That holds for the MTU values but not for the L3 state.
>=20
> Is this partial rollback intended? If so, should the commit message
> mention the new veto failures and the lost L3 state on endpoints that =
were
> already resized?
>=20
> > +	}
> > +
> > +	return err;
> >  }
>=20

Yes, partial rollback is expected here. The comment above the rollback =
logic already mentions that - "Failures here
are ignored".=20

