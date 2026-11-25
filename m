Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795583216;
	b=e1LNUkjb0UuN0sX5i8hZzP6R2Y8amVME8l/KryBPa9k6E/rBCN2/FAj0YhxBF/JQdKMG
	 zqwhgtyQtBFrDM7Hej2fGNzfUj48+FOjcFgnvVcAScT/qh3NW4WDqZS95r4bWE7Zr3PRN
	 67jE11DA5OMkVf8HyV3fA85ysf1avkBP0nt8e0aF/G5qCUUaHrbSFcgXjeh825vyYD68B
	 H9z1XQ6aJ8tf4TUjoYumDBjD9qipXiwnAbpjR0Vhp73BVi1JHkGWrtuxXAM3MKD3ylCJa
	 4ij2tFeo49nJPbiM8m+EH8hRqcnQstF6SgcaFeVqtnkAm5mFsVy5PvCp60I+oBnSPIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795583216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=St9qGG3raKOdkDcDbquwSocgYR27/42BAaGi49zTWXE=;
	b=oEpWR5pAlm386YVYxXMXmKaGFbV3VHwZJlhAuNB9jXTSjA6wi54Z2qCVYS4q5chjL7Er
	 ToD9t/GlD3YRIKRVV6EwFIwjA/AyJUriuUoRQ9oAQgsNif7xlPt/eSFC43hcNWx4ITqQh
	 zqNbaL+FyhM8nQuTWxFesEsj7nZnVZL8gNwxf6xLMERxEYB3iWihWekFWcyMCSIBCM7LG
	 spIq+32D9i5QkX2R9HeHcXeR+bhDu29z7ke46/0szLF7AKxr5lj58aUTKXrXU3eXfY/rJ
	 3orP2vgH7ySG9Hf80nEvBCCZEa/Ojgxt/MiTMXVDPXGaLzgoIFeeZdUTC0S6GNLmxdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=WvCW1Bg4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93024606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 05:06:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93024606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=WvCW1Bg4
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so8210302a12.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:06:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795583202; cv=none;
        d=google.com; s=arc-20260327;
        b=lTWOekGFU5YpYjfnjzibHUzOecuy9UzRTz/Rkladr8QAOr0/H9uPyRVZ5y+aCDWXGf
         mSmcaouRsvj7X8yqG621ILlO2gFvyQutBJqC0Y0Tc8sgiEDcIoqC5UVBSiI/akz+Iuev
         RPA1NoHE5Yq1ehhieAwfDwPdld5EOiNWqqGZwuPhqCO2olM3m4z+ItOiBK2HLEajwrBQ
         JBioYIwbl2C40346ngJSs5BDitvfXaPQr1lSZIO5dadI4957UYKpTEue318KB3sm+DMF
         PZ/NBxeaDiuSm1Ax9Oj1miI2Lt3Gl4N/53MjcMOT+pVciMW2hA2fqtgyHZIj39sleUpR
         grjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=St9qGG3raKOdkDcDbquwSocgYR27/42BAaGi49zTWXE=;
        fh=i8YMUav2PbA1wbtupCM2h4xABw1fTIXtmwyWK7WMkwY=;
        b=i9/IieNSVKJ/uGopgWPpt8JXvgJAWJlEO1ZcOPijQQ/p3FzuI3H0CQ1CeAZY1Z4pdl
         kS2ZUQ9loFodnXEq031copbZ0rGvRmsLskW6VR6maxPeLEoK5ksz1zosyDk5LJ+O5pNm
         zSK1zYD5M30qOlTxU8JlWzpt1cf5XIkC3jtr/1u3mB043xx2pTovZGDMzRVZtRVpwo1j
         7qB6MsGPTEMiczUrckVeGPn3BxXdU96TtEhXIGaxYCyI39J4NQmITFI5Dyom0gyRHDES
         aXknhF+En95oY3onh88K0CHgx0vIeZO9QInxSLuSXT/wVB8MbKYflPVzldVwMxDgetdm
         lHQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795583202; x=1796188002; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=St9qGG3raKOdkDcDbquwSocgYR27/42BAaGi49zTWXE=;
        b=WvCW1Bg4ViJubZeAEI0wYclnYXwKcIfPWWaMc9ZYTHNFKwJAVdCHcNiTzHn6PetD/3
         myrf5RFaZ2plYTw8GPMbuKPDxhjAr/O539xfOwB3qv4OIeo/63IuHPGAvb6uMnWgI4DO
         0LoFQkv5PtCnVQ9jmUSzUtB/4qlHMRW3ijYiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795583202; x=1796188002;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=St9qGG3raKOdkDcDbquwSocgYR27/42BAaGi49zTWXE=;
        b=MI8IwJvtmHBXp9MTbjSkJj6CpZmv0Os4W74kEs7xuDKjcAyoIypTEPBaGZV8B57N+g
         ruCeY/eYKRp0e/2NikKR/jCvXKVgK43qVKXmtdVC6C3FhFLQ+quiNL5L4ZhvecnenUBC
         KnJ4Paz7wr1BiFrUv0UuB8otnGyxls7OxQd53VKxwqPb0VdVSaUJamcY3dw602Alhj+w
         BOynnCXvelIoI/2vMAbr61H4AfqA/tPvyHEUM2lg+5k2OhbJBkbn420KBtFhKMmRbTRa
         xkIdxpYIp5g4edMA+yQIpvMAFd3gOOshnvvSdw5k8bANzVezJB8uURd1esKe/uSQj7Rr
         Gc2g==
X-Forwarded-Encrypted: i=1; AL+hErHi4J0gclOELwF9tnnKjOBBxJlbmzZTS6FbYcgOGOHWQmY1LIQO1aQW6VJBGKibCQk5Djpw/Ug=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NlMm7Wz0v66gvGm7fBQRUmdLU6agE+mx1yUlffCXKbSZTbvOs
	bVpK5ZSuG5RIzjJZzmUAcJF2VplCSxI+J1VVSQB4YT446/X7to9AAR2106ocCUNrjrXpUqYsyjd
	eFc03Vw92GMQM54e2z9GboXg8u1Lkl+ak/0e1sWk8Xg==
X-Gm-Gg: AZFdTZdb9qHkmCmsxWk4sTBJKbmYi3J1BCQfUJR4C7/P0X9rcyjjq+Iz1PNwB9MpqeR
	Ri7CcMXeEpPyF4A0VKBYg2apqsDXilMEGOYy22dx2GrGN8WrW1819O4HNIPfOiv07fPZ3SiU40G
	efHRMmijKFB96NKWKvIaF/aiXTrMEg7uQfjbpzPxUnLNic8iluOW8/O2kFwyZt6I9vbI83KZSv8
	5BIcyofFcPuSvCnrBQayXg/vKuvn8kmt3pmjhoo8BJ5Oy8CrrkpxugivjNofxVpsQlo9SvDhFwZ
	h0Ib4oH1azS+i2vQFxmH8hwR4od4dMYFSw5QgQEqnsQhy4jYOeYI3qhlsirfSL5ImkKDOwpf3sa
	bISpMt1SwLkcV6Ev2gKp/HvJQTFbDisdc1BEhDDYE3FWBaF+8XFn/gZrG7rXS8BvWq85/A10iFC
	CdsDBfHokZFV4m24oGVb9eEKqFK3u18QM8h9ZBXfHyG+o9h4X0nOnG0fI=
X-Received: by 2002:a05:6402:504:b0:6b7:1cd4:87d6 with SMTP id
 4fb4d7f45d1cf-6ba37d17fc4mr8799911a12.13.1795583202056; Tue, 24 Nov 2026
 21:06:42 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125043847.885053-1-piyus@iiitd.ac.in> <179558178888.3294.13943698848591637747@kernel.org>
In-Reply-To: <179558178888.3294.13943698848591637747@kernel.org>
From: Piyus Kedia <piyus@iiitd.ac.in>
Date: Wed, 25 Nov 2026 10:36:30 +0530
X-Gm-Features: Aa3M54oDWglR0iAUavzHNeiehG4Hg13FhPc-XMGjpMFLClMWzn6h4NFTqVwgfFs
Message-ID: <CADq=QSx-7eYx93XbdGLTxHp4-O-=gO_6VyS6R4XgZzDXMG_ErA@mail.gmail.com>
Subject: Re: [PATCH wireless v2] wifi: mac80211: store the mesh IE blob's
 length without truncating it
To: netdev-bot+sinfo@kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kapil Vaswani <kapil@presceralabs.ai>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi!

The bot is right, and the information is in this posting - but under the --=
-
line, where git am drops it, so it is missing from the commit message itsel=
f.
Stating it here as asked, rather than reposting:

How it was found: by AI-driven fuzzing built on top of syzkaller.  A genera=
ted
program put a vendor element followed by an RSN element in
NL80211_MESH_SETUP_IE on a mesh interface, and KASAN reported a
slab-out-of-bounds write in ieee80211_mesh_build_beacon(), reproduced on
mainline 7.4-rc3 and on 7.3.1.

That run is what found the beacon-tail overflow fixed by the other patch of
this series, "wifi: mac80211: do not copy the mesh RSN IE twice into the
beacon".  The truncating "ifmsh->ie_len =3D setup->ie_len" that this patch =
is
about was found by reading the code around that crash, and by the review of
v1 of this patch, which showed that v1 made the overflow reachable rather t=
han
fixing it.  The two routes the commit message describes - a blob length tha=
t
is a multiple of 256, and a 257-byte element behind a truncated stored leng=
th
- come from reading the code and have not been run here.

If there is a v3 for other reasons, that paragraph will be in the commit
message.

On Wed, Nov 25, 2026 at 10:13=E2=80=AFAM <netdev-bot+sinfo@kernel.org> wrot=
e:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
