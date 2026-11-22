Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795374549;
	b=tk4dA1yXD+NYcHMKhmzs1aI7RcCjEJbmD7G2iuLQ9ekfyvq5sFo0SrXlIfWNzeNAxSRT
	 Ho9thGgoDEDBKMCGBEwqTI6DYmxuvz5WXtfDBj7xxTNdgqu3yqquL+zDShNZ3MV9pok6p
	 Jdd3EUcrR4UP/LRiZmzcUa7XnM3NFOaO2SLOJRQglgkZAPDijVbO2CLAyx1YODjpCMZNn
	 agIAn77/GXyeUPSNsqR7NaE4M5UekKoqtRmfTkeyFhF6GhrcEekUgC+VAHq41Lf+Zl6kU
	 xWDhLz+J74qWmcrmrT7BQ4L6NJgStNl2uZdVQAoF8p/BsK4IQUgQwbE7lbkGcmWv5Nw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795374549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CB+Tc1Jtd3vDTOOqs8UPEsfneIWH1RMR9VJaPDxr1HE=;
	b=n05tnOGS+X75E1GbeH92iT+vDwRoiW6587Bws1aAGaK5nuEgmv7sjuLt97hgQ6BzUg3f
	 QjYmTpI8YpCriQL4PV44bznf2mimeAEp6zq6mgohJT74RXbdeLzBsynaxzE9DTsNd+e2d
	 izzRKrnbMHk3aKgmy9vAnmq5bKohI3a49YpwIs4db1I+lyECxbVMx5SHxNDr/qsQHs821
	 WnOt4RzAUSralKwweQ2apo9lSDXw95uuBx3ZIm1WS4sT3tlNUtrwAUOEJ0P7/UlBuj89x
	 +ZSvACAUuSadcB0jV8ggRyB0tZeJFPBuMlk3f99fnWksRN2gPhKUQFVnl/OJCFHW33Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JladkRuN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D94E606A339
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 19:09:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D94E606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JladkRuN
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c407213696aso44678166b.0
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 11:09:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795374547; cv=none;
        d=google.com; s=arc-20260327;
        b=qLGbidvCQJ5yFulCY+fFfGIPIAyEulKAfXygd/uJZsA+MXofSCILTAaK/DmWNqEw1G
         i50G/27ReYzo/K1jEpullckqDKsVp7zfpGI1I2XlPa6P3+VviEAAIPWRmA0BWoIwxR+f
         WMafesoxCMiMgHaIhgnMbuWKlNMcZ5hg/IdElWP+rBFqg7i6NJz9NTV685O3jmQqrJrf
         TnW68Cnqj+94rZUCMawEk7B2ftqETL0mgu5SKTWR+tdYcxwBCNEhCh9BsjQ0v5keISv7
         FFtlzTNcPz8JC+9rvrjLqiiX9xySDG/pkCQtkMgax6TT/lz/QoyVI05yBzFcFzdY6pta
         He7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CB+Tc1Jtd3vDTOOqs8UPEsfneIWH1RMR9VJaPDxr1HE=;
        fh=AuSFZ/+AvPQpIzq+UIS0KtxijVNVgpAcYvhx3pwEVzA=;
        b=LeLzOfcETBJ1Zj0i81nAQg5i4NCmHCwUVEDjUwQXZ240hOCTtL7iTHTO5fXCe021n2
         ObXWJiakzeFz0U5QYhvDn5dAknl3Uiij9XF+QVenvOP8dejUHzXWd6ETtPMEkkXl77iq
         iXaCEyiojEAWN8YPZhKCrpiSuUzUd3IEP0daBc+PEMTtRk1J6Y54wJZaFMKEhOYxi82Q
         W8VLxXkCVSQVTRe8PpEtkJCBLYxM72uvLxb3Zf36ifBfY7VzhYng1b+JbCZYDFQqqmc4
         08jr9w3a//0IPD5W2Uz59owntRHv7cbdg68tu+VcVqYzWxLcaDTYy/TXa0yEA7kKS2kP
         vgpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795374547; x=1795979347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CB+Tc1Jtd3vDTOOqs8UPEsfneIWH1RMR9VJaPDxr1HE=;
        b=JladkRuNsh+AsdjnSi5kOQPxOAclkjeLFj5cfGt32BJLnXiis2Bjzd4Kd6JjQPCSk0
         y18f3PNeQn2wCzr3pglGbE5Y3lu+IPBf0NVFJM5gRZcgFrRoIH5hW8MRLjRr8+2mVehl
         akP7SDd5bG8x9ol2TyxiJC2yhtqNY9lQ/tZ45/XAdFy6V5osNwblPRtE+KQo9xpcD2GP
         oQ2ObcltTX4noAUGKf6ztlZqTNvX7sGK51NVqdcnmOkIb6HIeksK/t15DOZTeNZMLdiB
         FXEth/0uWswzjOExfuS36+/z3e/cSB1L1Nbt9qnAKC0Z27iQVB7kASCIYbIKCZHAZwU4
         zE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795374547; x=1795979347;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CB+Tc1Jtd3vDTOOqs8UPEsfneIWH1RMR9VJaPDxr1HE=;
        b=Lxl2tSoTJW7Uu/nfDPzDv+6gkDIVRgnVOjguPUn3FclUnjCTYeb31PJakZrHEU0m9Z
         qMvxrOkzxhN/M9D8rvOjftSM5xYlPTZFsQiHagUAq+rJ+IeDQH92HrgLmlNrTzYG7Xpc
         jOimtMkIga5grx26phKx04PR8oFGEIiSBxGqhozwOQA1dBYJMUYvqf+MIbaOihfTIByb
         8ulOBfcZKizNvky8mskgi0cL7htC8KNWZ8WDPu2e25+uVpxDlLUXzIx0uql8xhGNd1Oy
         h3diEaJXrGNlGWG5cOqP7v6ZsSE/dF9A1Q8jOLAMa6lXRfzBM7jSnH/0zoDAsk/wD4UI
         wKLg==
X-Forwarded-Encrypted: i=1; AL+hErEsg9duAOWV0gyvo+xjnHmxyKwJwjlVbYDaOEd9rf3atwCKy1eWoOZHqHzmYAwp6FJA72KlQXQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IKSELkWXmeULt2mKa6TEG1KU95PDBtsaJHaPI6sye/R3QEeFX
	JGuIl57aQzK+yW4TUzRamW7zmDraucjLUpB6ugwPEgEdlreThHDXFO8dmi2QdDjbVNIWssXL9lu
	gFwx50BEXl2Kv2ywhE3dvMUi1TsESYHw=
X-Gm-Gg: AZFdTZc/zYWQZZ8cQpBRa/DBgLBXIvfUODODwGYesBhqFvMoy9ifY11dGcnL4x4P7Xw
	HQqAj/fPkF9oj6FJMLGVrTaS21HR8ULRyWYoGTkZ6Cp3h1JObWMPRXK+gGoJji5pLfxTX1oFopM
	q8N8PRxnLWni6N76LuAxCKkEarkgYJSUCy758EfqZ3txXIdFxoV1Lo9ZW66oErIBxKEUYnU2AWi
	gET+dP+IK5/PCyTUKNn/QzeT/k5V4ZqDy4wSiM4gNiGEfZXmJRAldd103aFmUTpLukO4m7nt+N9
	UG+DXP+xztnAUvTiQt8bDb0qzepQa37cC9+X6GTJhZbuGPeAkhuVZ1ybkGUAk6faxEs6eITsS+Y
	evOr8xs0RFLp1jdVOjbTQ3TNNy0ZTpvQfndaEcXKg/b6QjAYlEq3YtRT3hGS7luWwTsWLFmNSvG
	ZvORB/NwW0nFBVR/X4ttA55Y5l/2HF6S2MWHxOr6mt2EAq5Bs8VydyVQDuln2bvz9SUEp+GLWMB
	hOACwp4RK36CWGcm9Dv19qQ+rhUgIW4IMjAwojS
X-Received: by 2002:a05:6402:22ed:b0:6ba:b1ea:3994 with SMTP id
 4fb4d7f45d1cf-6bab1ea3a65mr739297a12.3.1795374547296; Sun, 22 Nov 2026
 11:09:07 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAKfe=Pq86f11-_GJNRwCN-m_TAMu-Dc6B0RvgqVk28=waXkVow@mail.gmail.com>
In-Reply-To: <CAKfe=Pq86f11-_GJNRwCN-m_TAMu-Dc6B0RvgqVk28=waXkVow@mail.gmail.com>
From: George Kokolakis <george.kokolakis.ece@gmail.com>
Date: Sun, 22 Nov 2026 21:08:56 +0200
X-Gm-Features: Aa3M54pDBYH5_5YP0kBblreRGNzte-1MvevIdDloABJWZtDsbnl1nNqNWjTdzKc
Message-ID: <CAKhuk+kK90gTr1AgG-B+MrxtZ9N8K91B+1v4xcjA5zD_JpPT-Q@mail.gmail.com>
Subject: Re: [PATCH RFC v3] ACPI: PM: Use EFI power off on Lenovo ThinkPad T14
 Gen 5
To: Gabriel Giner <gabriel@clicseo.com>
Cc: linux-acpi@vger.kernel.org, rafael@kernel.org, lenb@kernel.org, 
	anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com, 
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Could you try "modprobe -r e1000e" before poweroff on your 21ML? If it
> also stays off there, the quirk probably belongs in e1000e rather than
> in the ACPI poweroff path.

It stays off. 21ML, BIOS N47ET30W 1.19, I219-LM 8086:550b, kernel
7.0.0-43-generic, my EFI module unloaded (plain ACPI S5):

  modprobe -r e1000e && systemctl poweroff
  - boot that followed a "systemctl reboot": powered back on within a minut=
e
  - next boot (cold start after that bounce): stayed off

Same warm-reboot carry-over you saw; it also explains why my EFI
workaround passed some tests and failed others.

Interim workaround here: a systemd-shutdown hook that unbinds 00:1f.6
from e1000e before both reboot and poweroff. reboot -> poweroff now
stays off with plain ACPI S5.

Rafael, please drop this patch. Adding the Intel wired LAN maintainers.

Thanks,
George

=CE=A3=CF=84=CE=B9=CF=82 =CE=A0=CE=B1=CF=81 20 =CE=9D=CE=BF=CE=B5 2026 =CF=
=83=CF=84=CE=B9=CF=82 12:25=E2=80=AF=CE=BC.=CE=BC., =CE=BF/=CE=B7 Gabriel G=
iner
<gabriel@clicseo.com> =CE=AD=CE=B3=CF=81=CE=B1=CF=88=CE=B5:
>
> Hi George,
>
> I see the same power-on after S5 on a ThinkPad T14 Gen 5 (21MM, Core
> Ultra 5 125U, BIOS N47ET30W 1.19, kernel 6.18.63). An EFI power off
> handler, built as a module along the lines of this patch, did not help
> here either.
>
> On my machine it depends on e1000e being bound to the onboard I219
> (00:1f.6, 8086:550b) at poweroff:
>
> - "modprobe -r e1000e && systemctl poweroff" stays off
> - "Ethernet LAN" disabled in BIOS Security > I/O Port Access stays off
> - with e1000e bound it powers back on every time, without a cable and
>   on battery
>
> Ruled out here:
>
> - WoL (systemd .link with WakeOnLan=3Doff, confirmed applied)
> - every power/wakeup flag under /sys/bus/{pci,usb,thunderbolt}
> - every /proc/acpi/wakeup entry (LID, SLPB, AWAC included)
> - Thunderbolt, USB, WLAN, WWAN and Bluetooth disabled in the BIOS
> - xhci_hcd.quirks=3D0x42000
>
> The state survives a warm reboot: after "systemctl reboot", a poweroff
> from the boot loader (systemd-boot) also bounces back on, while after a
> cold start the same boot loader poweroff stays off. Hibernate (S4)
> stays off.
>
> 00:1f.6 has power/control=3Dauto and is runtime-suspended while the
> system is up, so at shutdown it is runtime-resumed and then goes
> through e1000_shutdown(). I have not narrowed it further than that.
>
> Could you try "modprobe -r e1000e" before poweroff on your 21ML? If it
> also stays off there, the quirk probably belongs in e1000e rather than
> in the ACPI poweroff path. I can test patches or collect more data.
>
> Thanks,
> Gabriel
