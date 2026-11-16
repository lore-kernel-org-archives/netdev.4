Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843226;
	b=jN/85NJMQREGmeb1cyNdyh6mPumHJRCcP5z0xYNdMGGshp+XVm0Q1ZrtA8JD2d7rvmCm
	 PQoJRABsxLPm7wp0htRU9Lu2qJJZlZRPVo4gPUo57hXo8dvcsQiMCppCQ4wYBhvFiPuL5
	 BJ/n9g2A2v7RyL7GzxomG9+rri4MyrHBXcikp3YgoE5T2Ge2u6qy5Y352zvRAKlxWDElf
	 QYN/xrWSbLiqjFb9un8MvNHIJopWlgBs9DD33bN0CYFR1zz11rE26U8yHlmgtyfZGko3q
	 P2IctdfkpQC/2eRfCUK6fQtbpP+Pn83QJ6lrsL0bIuogZZKahJ5RJjYJJwzN3yExxMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843226;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=u280Ub6DUw9TiRnuNaGZuwwxw4tgqFoh9XlrjuzkyYE=;
	b=KmiRBHcMDXro/Fz+2kKj3gNiL/w61wjCKO2M+40mTaQO/H1u81DkdM+Y/4sSPicPHp2a
	 OdvSFU0h1fqwABLEKGrqZrTIdp64vhnWBWJbuZMp5SdmSDG5V9l4aAJH+8mTuGcQkjMaF
	 aRwSIueUXsbHYrNs5wurW/BmmyJjyTiabE70VEE2v/d4pIihlr/d3yWCxpXo6Ar6fcRBj
	 8A3/QLXeuuBvpS9tytg9wGxV3n80rXRGgSmhDC4HZ0iF6kbzdeVwtya/jBJXv76DTyhUO
	 nrK4YbtpwCarozvJ7ptLcgEEDfnbdGV1WKlfBe7yhS92Sn5Uk8vAo9/0b/Tr0sT7N8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=QJ1ZXOBm;
	arc=none smtp.remote-ip=185.70.43.101
Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694A4606A323
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 15:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 694A4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=QJ1ZXOBm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794843222; x=1795102422;
	bh=u280Ub6DUw9TiRnuNaGZuwwxw4tgqFoh9XlrjuzkyYE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=QJ1ZXOBm+3owl1fP0mDaXklFiGtvvUqUjnrMCymu6zCyv/I0BqU1vBykzpnXOFgHU
	 m5Rh+J/NpOeCqY+DQdaNBp/wYlli4aIn4TBnLWInn30bE86/NzdYVNAcAZc2KfRGFZ
	 HUNUqHv3pE71nhxn2X7PeMNrskIOpRuDyQ6upeQez/+5WqARtZiWnY+p+6/v8E67p2
	 WoOgrZyldWNEOCit0h1abnR30sMR2eDgOlMrgiBa8s1uyEtswGEakJEb+0bvA/TFIR
	 NN+Xr0Jg0mAajary44IKXcoUrRjI4Wp5Yv8x2MxX+l5fcCdExS0zjZ64pq3ai7SYGs
	 blA9SXrIoyMBQ==
Date: Mon, 16 Nov 2026 15:33:34 +0000
To: Birger Koblitz <mail@birger-koblitz.de>
From: oraveeps@pm.me
Cc: Hayes Wang <hayeswang@realtek.com>, "javen_xu@realsil.com.cn" <javen_xu@realsil.com.cn>, "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: Re: rtl_nic: request for rtl8159-1.fw (RTL8159 PHY firmware)
Message-ID: <_UaKZWNBXKesn3Fs-K3CGlNkAlK9xo9fr2afljGGYly9TeCwoGm6clrPRrdqQJdY8UTKP3keDnuuZldjild3ss5cAosvUq6lVJR24BD3GrQ=@pm.me>
In-Reply-To: <02b33fd3-867a-431f-b1f5-2fd15eb9ae1d@birger-koblitz.de>
References: <PfNGg6VjMdDzTCX2LETCm65NKSR0af1EG7ZX5CI-7Fef0x8NE2MnZ8fNtgr1Hm86sNjqHXcNyyqIbbeZL5jDu7URTqMygnyj4ulG00NxR7U=@pm.me> <7b6ef8fb2c14485380c90f1f7521ea9b@realtek.com> <tPt9UQiUVXfE9K4MHjmkc9no1QcTNZAOhmdtvdx_yaIkVdWoxkTdDFxCdBK5RU5nKHrKGy99QZq_rUsF0mWO9bfPZmS_8tjbbrNl2B5mNwg=@pm.me> <02b33fd3-867a-431f-b1f5-2fd15eb9ae1d@birger-koblitz.de>
Feedback-ID: 208684824:user:proton
X-Pm-Message-ID: 991ec33202610757365560ac6ca95f513b49b28e
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Birger,

thanks, that works. I built rtl8159-1.fw the way rtl_fw.c does, but from th=
e ram17 array of the out-of-tree driver 2.22.1 (code version 0x0022) instea=
d of the 2.21.4 one in your repo. With it the in-tree r8152 on 7.2.4 loads =
the PHY code after a full power cycle without errors, and the RTL8159 links=
 at 10 Gbit/s.

The PHY_SPEED_UP block in Realtek's candidate file
(pwr_on_patch_v22_pr_test_ramcode_usb_20260428) matches the 2.22.1 ram17 fo=
r its first 16536 bytes, then ends. It lacks the write of the PHY firmware =
version (SRAM 0x801e), which rtl_ram_code_speed_up() checks after loading, =
and the parameter table writes that follow it.

Best regards
Jonas

On Monday, 16 November 2026 at 13:07, Birger Koblitz <mail@birger-koblitz.d=
e> wrote:

> Could you try:
> https://gitlab.com/koblitz-rtlnic/rtlnic_fw
> I used that testing the drivers. It is based on the source of the
> out-of-tree driver and creates firmware files compatible to the Linux
> driver. The firmware needs to be generated from the source.
>=20
> Birger
>=20
> On 16/11/2026 11:37 am, oraveeps@pm.me wrote:
> > [Resent as plain text, the lists rejected the first copy as HTML.Sorry =
for the duplicate.]
> >
> > On Mon, 16 Nov 2026 at 09:30, Hayes Wang <hayeswang@realtek.com> wrote:
> >> Hi,
> >>
> >> Could you please try out the attached files?
> >>
> >> Best Regards,
> >> Hayes
> >>
> >> From: oraveeps@pm.me
> >> Sent: Sunday, November 8, 2026 5:42 PM
> >> Subject: rtl_nic: request for rtl8159-1.fw (RTL8159 PHY firmware)
> >>
> >> Hi Hayes,
> >>
> >> Since commit a51e171e176c ("r8152: Add firmware upload capability for
> >> RTL8157/RTL8159"), mainline r8152 requests rtl_nic/rtl8159-1.fw for th=
e
> >> RTL8159 PHY. Without it the link stays at 5 Gbit/s, and linux-firmware
> >> has no rtl8159-1.fw yet (nor rtl8157-1.fw).
> >>
> >> I run three RTL8159 adapters (USB ID 0bda:815a) on kernel 7.2.4. They
> >> reach 10 Gbit/s only with Realtek's out-of-tree r8152 v2.22.1, which
> >> carries the PHY patch inside the driver. With rtl8159-1.fw in
> >> linux-firmware, the in-tree driver could do the same and users could
> >> drop the out-of-tree module.
> >>
> >> Could Realtek submit rtl8159-1.fw, and rtl8157-1.fw if there is one, t=
o
> >> linux-firmware? I am happy to test a candidate file on these adapters.
> >>
> >> Thanks,
> >> Jonas Autzen
> >
> > Hi Hayes,
> >
> > Thanks for the files (rtl8157-1 and rtl8159-1, v1 11/13/26). Mainline
> > r8152 (v7.2.4 here, same code in v7.4-rc1) rejects them at the first
> > block: rtl8152_is_fw_mac_ok() has no RTL_VER_16/RTL_VER_17 case for
> > RTL_FW_PLA or RTL_FW_USB, so rtl8152_check_firmware() fails with
> > "check USB firmware failed".
> >
> > An rtl8159-1.fw with only your PHY_SPEED_UP block (checksum
> > recomputed) loads with the in-tree driver on 7.2.4 and links my RTL8159
> > adapter (0bda:815a) at 10G.
> >
> > The series "r8152: split RTL_VER_17 into QFN68 and QFN100 package
> > variants" (v8) does not change rtl8152_is_fw_mac_ok() either, so the
> > full files are rejected with it applied too. Is a driver change for the
> > PLA/USB blocks planned? If not, could rtl8159-1.fw carry only the PHY
> > block?
> >
> > Thanks,
> > Jonas Autzen
> >
> >
> > On Monday, 16 November 2026 at 09:30, Hayes Wang <hayeswang@realtek.com=
> wrote:
> >
> >> Hi,
> >>
> >> Could you please try out the attached files?
> >>
> >> Best Regards,
> >>
> >> Hayes
> >>
> >>> From: oraveeps@pm.me <oraveeps@pm.me>
> >>> Sent: Sunday, November 8, 2026 5:42 PM
> >>> To: Hayes Wang <hayeswang@realtek.com>
> >>> Cc: javen_xu@realsil.com.cn; mail@birger-koblitz.de; linux-firmware@k=
ernel.org; netdev@vger.kernel.org
> >>> Subject: rtl_nic: request for rtl8159-1.fw (RTL8159 PHY firmware)
> >>>
> >>> External mail : This email originated from outside the organization. =
Do not reply, click links, or open attachments unless you recognize the sen=
der and know the content is safe.
> >>>
> >>> Hi Hayes,
> >>>
> >>> Since commit a51e171e176c ("r8152: Add firmware upload capability for
> >>>
> >>> RTL8157/RTL8159"), mainline r8152 requests rtl_nic/rtl8159-1.fw for t=
he
> >>>
> >>> RTL8159 PHY. Without it the link stays at 5 Gbit/s, and linux-firmwar=
e
> >>>
> >>> has no rtl8159-1.fw yet (nor rtl8157-1.fw).
> >>>
> >>> I run three RTL8159 adapters (USB ID 0bda:815a) on kernel 7.2.4. They
> >>>
> >>> reach 10 Gbit/s only with Realtek's out-of-tree r8152 v2.22.1, which
> >>>
> >>> carries the PHY patch inside the driver. With rtl8159-1.fw in
> >>>
> >>> linux-firmware, the in-tree driver could do the same and users could
> >>>
> >>> drop the out-of-tree module.
> >>>
> >>> Could Realtek submit rtl8159-1.fw, and rtl8157-1.fw if there is one, =
to
> >>>
> >>> linux-firmware? I am happy to test a candidate file on these adapters=
.
> >>>
> >>> Thanks,
> >>>
> >>> Jonas Autzen
>=20
> 
