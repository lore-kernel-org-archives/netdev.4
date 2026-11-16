Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825479;
	b=2+mjwJuUCdAaFzpolL5o9I9WsqYCVehERMuVNWXngOCZHvcmvbykXWJeQ0Ksu3568tVb
	 WgGWSrgnN5QSodvX/yGjjzH0aak8FXZKmVgEsBO5m0sRyrPjhEdcABY2C4+5Sb1SbsmfP
	 m1i6jgV0ZdZKsmFmM+OGMfniwiF/bNr7qIA5pSR7+OIDQA1m6uGyb0SJclgOznWvVoQ61
	 KyNqrA2wOSAsU20n8zx3vkD05B03Tl/zIc2cG8IrXXf2UuhstvBpL2uY0CoFvWEH5phmR
	 HK1a9gH0R11kEEQvR4o0oGzDuMTQxtiKDFTzvbYWXBiW/+gQQVgdgYMqBD3iywQN5Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825479;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=JRz7ykR2WXJ0qnWsRkj7ad/vNCJXo8foNP4k0FNdN3Y=;
	b=Fu5cxVPaEGf9Kjk3ZPEbWCBvvhiG9HoMYWOvU3HtB4HHqezDvuGXdmrqwQ9/SIxbi0AF
	 bNwpKwaHtsQf+z8iRWF9J4EyembWlmyDe4/OpPK41pJO+mcHmxM1gGROQ5mVlMxBLnPXx
	 VVtAO5A6dSAd6OIcXIXCh0fVbkh4vOdBVgTr4yvV07P18t4L62zc0nPHyxQwjvRErKog6
	 Afi/q79QEcJDdwM4RnSiT6DRohnBOVRug5dw8JuYxNzI5QyZFS6Lfasp4RppJ5laSNh75
	 spny7SrnjrHwerSNVsN/tFKcolSj+CyRJ0vWkrVFepY2bUNaS8toHKQTVBXcwHgZ9Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=K92Eksdx;
	arc=none smtp.remote-ip=109.224.244.18
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F573606A323
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 10:37:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F573606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=K92Eksdx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794825476; x=1795084676;
	bh=JRz7ykR2WXJ0qnWsRkj7ad/vNCJXo8foNP4k0FNdN3Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=K92EksdxhvsBj4FQRPNYURCe8MG1PXtvtVZqsSO7ZR7Wkxppl+VJhT3hYApaJfCpM
	 taVR2kDJzhw+IGN1elkZ4LYRs/JPbVCUyqo4GMqnMKP599FbbvHoruokVKM63wriHF
	 ltdWD+KfHkhHSGQwha8TFSwFMmi0z0NGn4rNuCtDWID+DeUQ3JP6J2AqI1OzLydwty
	 Ku8DufH4CEDNg1fan+uh6XoE1XcDNkBgxOFYk41Xp+5PxpDhR0R3AB3T1J7TtRpHpf
	 srrZ1ZYW9Vh/AJ6s8qNMaNJO0/DvcgFsV+AfexfQuP+d+r52XYt1qQR7PUTB7dHSzc
	 aIwe6Rie1I+6Q==
Date: Mon, 16 Nov 2026 10:37:51 +0000
To: Hayes Wang <hayeswang@realtek.com>
From: oraveeps@pm.me
Cc: "javen_xu@realsil.com.cn" <javen_xu@realsil.com.cn>, "mail@birger-koblitz.de" <mail@birger-koblitz.de>, "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: RE: rtl_nic: request for rtl8159-1.fw (RTL8159 PHY firmware)
Message-ID: <tPt9UQiUVXfE9K4MHjmkc9no1QcTNZAOhmdtvdx_yaIkVdWoxkTdDFxCdBK5RU5nKHrKGy99QZq_rUsF0mWO9bfPZmS_8tjbbrNl2B5mNwg=@pm.me>
In-Reply-To: <7b6ef8fb2c14485380c90f1f7521ea9b@realtek.com>
References: <PfNGg6VjMdDzTCX2LETCm65NKSR0af1EG7ZX5CI-7Fef0x8NE2MnZ8fNtgr1Hm86sNjqHXcNyyqIbbeZL5jDu7URTqMygnyj4ulG00NxR7U=@pm.me> <7b6ef8fb2c14485380c90f1f7521ea9b@realtek.com>
Feedback-ID: 208684824:user:proton
X-Pm-Message-ID: 40914b1d11dbfb9b30d26f7b45f0d9765fad47d0
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

[Resent as plain text, the lists rejected the first copy as HTML.Sorry for =
the duplicate.]

On Mon, 16 Nov 2026 at 09:30, Hayes Wang <hayeswang@realtek.com> wrote:
> Hi,
>
> Could you please try out the attached files?
>
> Best Regards,
> Hayes
>
> From: oraveeps@pm.me
> Sent: Sunday, November 8, 2026 5:42 PM
> Subject: rtl_nic: request for rtl8159-1.fw (RTL8159 PHY firmware)
>
> Hi Hayes,
>
> Since commit a51e171e176c ("r8152: Add firmware upload capability for
> RTL8157/RTL8159"), mainline r8152 requests rtl_nic/rtl8159-1.fw for the
> RTL8159 PHY. Without it the link stays at 5 Gbit/s, and linux-firmware
> has no rtl8159-1.fw yet (nor rtl8157-1.fw).
>
> I run three RTL8159 adapters (USB ID 0bda:815a) on kernel 7.2.4. They
> reach 10 Gbit/s only with Realtek's out-of-tree r8152 v2.22.1, which
> carries the PHY patch inside the driver. With rtl8159-1.fw in
> linux-firmware, the in-tree driver could do the same and users could
> drop the out-of-tree module.
>
> Could Realtek submit rtl8159-1.fw, and rtl8157-1.fw if there is one, to
> linux-firmware? I am happy to test a candidate file on these adapters.
>
> Thanks,
> Jonas Autzen

Hi Hayes,

Thanks for the files (rtl8157-1 and rtl8159-1, v1 11/13/26). Mainline
r8152 (v7.2.4 here, same code in v7.4-rc1) rejects them at the first
block: rtl8152_is_fw_mac_ok() has no RTL_VER_16/RTL_VER_17 case for
RTL_FW_PLA or RTL_FW_USB, so rtl8152_check_firmware() fails with
"check USB firmware failed".

An rtl8159-1.fw with only your PHY_SPEED_UP block (checksum
recomputed) loads with the in-tree driver on 7.2.4 and links my RTL8159
adapter (0bda:815a) at 10G.

The series "r8152: split RTL_VER_17 into QFN68 and QFN100 package
variants" (v8) does not change rtl8152_is_fw_mac_ok() either, so the
full files are rejected with it applied too. Is a driver change for the
PLA/USB blocks planned? If not, could rtl8159-1.fw carry only the PHY
block?

Thanks,
Jonas Autzen


On Monday, 16 November 2026 at 09:30, Hayes Wang <hayeswang@realtek.com> wr=
ote:

> Hi,
>=20
> Could you please try out the attached files?
>=20
> Best Regards,
>=20
> Hayes
>=20
> > From: oraveeps@pm.me <oraveeps@pm.me>
> > Sent: Sunday, November 8, 2026 5:42 PM
> > To: Hayes Wang <hayeswang@realtek.com>
> > Cc: javen_xu@realsil.com.cn; mail@birger-koblitz.de; linux-firmware@ker=
nel.org; netdev@vger.kernel.org
> > Subject: rtl_nic: request for rtl8159-1.fw (RTL8159 PHY firmware)
> >=20
> > External mail : This email originated from outside the organization. Do=
 not reply, click links, or open attachments unless you recognize the sende=
r and know the content is safe.
> >=20
> > Hi Hayes,
> >=20
> > Since commit a51e171e176c ("r8152: Add firmware upload capability for
> >=20
> > RTL8157/RTL8159"), mainline r8152 requests rtl_nic/rtl8159-1.fw for the
> >=20
> > RTL8159 PHY. Without it the link stays at 5 Gbit/s, and linux-firmware
> >=20
> > has no rtl8159-1.fw yet (nor rtl8157-1.fw).
> >=20
> > I run three RTL8159 adapters (USB ID 0bda:815a) on kernel 7.2.4. They
> >=20
> > reach 10 Gbit/s only with Realtek's out-of-tree r8152 v2.22.1, which
> >=20
> > carries the PHY patch inside the driver. With rtl8159-1.fw in
> >=20
> > linux-firmware, the in-tree driver could do the same and users could
> >=20
> > drop the out-of-tree module.
> >=20
> > Could Realtek submit rtl8159-1.fw, and rtl8157-1.fw if there is one, to
> >=20
> > linux-firmware? I am happy to test a candidate file on these adapters.
> >=20
> > Thanks,
> >=20
> > Jonas Autzen
