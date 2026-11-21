Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795296286;
	b=TTsAZIpCHHITZzLV5QSZS+yLvd/IcilHXRCrAvmR3ugSMCKC3bM6LaYHO83mjQ1Smi2u
	 asJLjaGy+wo/sxlKRs3TTRluqrf5fkjQSCUT8ffoNvMJ33XRdhXfs58Ff3sQ2Tj6lldag
	 vaNYfZ9O9NFNfnWQBXVlzS2B2EVLmXL6gUm3swaIkkXChvojlAMJWXJ8SU2C/JSc8vncB
	 Z8kfeJZr5pupngddkur8m+wDSwECsjA5Pl4hTtySsFz0BjClTaayrwb1+W3u0N9QlKQR8
	 /BHv/TPd+7zU+YcGRgjm2UOqKOmSHaLDn+qUDCwcEGsoedRQyY21aXmSZqDo66kmtXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=hMi5a02uE/uzSpXExAF4Lkyvu0CQTRncxuVGo5iO8pE=;
	b=lQHNUp3mHsHcw1sIhDTIKs7FdJAQVB+hKeBiyxRQngoITleY9eB5VsDw48n9WazK88Ye
	 g6BlPu5YPRuIptpAcoMN5CjEcjYsZdjcdgeX5aX5hLYtEd4h9ugRdal1k9CuemV8b0Rsq
	 KVJSkl4jw1BLI9W/tscsfOh5ywcGdTVx+rwJ8GnEhi/rmyM+yqJSv6RJHXCh7YOnHUmn4
	 7pRVoDQqoe4RfR2NnP48xa5DjvmSqbMTHYr+wTyYcA8a38/C5vVk7JZZIF2KAV+UKdLbl
	 E0BG7Pr0fuCMB2XzMvZVcNM0Ammu8ecdIuDfonApwSjuXGoexsN9FdCa8gpVfAg//+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ftKiXWlG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9ABD606A33C
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 21:24:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9ABD606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ftKiXWlG
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b4ea3c5afaso14253037b3.1
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 13:24:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795296285; cv=none;
        d=google.com; s=arc-20260327;
        b=CTiqLhtAuZXAx7qCL3XLBvUOcZwdH9420GJAgFUCtFkrL1nCwWmZkOm91q1T8etfgb
         y/KLkNLGZvLijdK11VU9buKmhvZ/rbbk+9PvLXPqZbsH2MThFjusDzQV6SiHTMRnhPSf
         YpKWTp4sVzG0uK1zPdGm1rqh+y+641kF4o49NKFLHj6At1D2idHaBSWNsGLsKUzBCtJR
         FW7vfjpGPt6h+HBjBPXkCtX2zKfmefnb/W3FYxk50jP1RYzGN+u5Um9G8BLTRM4K9NNY
         TEluCgpnu6c7mLdGbnbxQcDnE01QGDS0EpuhqU9EdxFV1ghGhRdTXrmYl2zA2VqDLPql
         cPAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hMi5a02uE/uzSpXExAF4Lkyvu0CQTRncxuVGo5iO8pE=;
        fh=BfezvSDGmrxEYVKvfATUoogM2tvEkvNCnf3TdcPp+yg=;
        b=ZZV21bNpPtJcg5Tp1nWL/nmawcINiqwn5fTpdVvCPSGcCtHLr7sXHW5sPx8hXWitDR
         kK1SOVtP+RemhEWUbEpof3E+IBxFqkiMJsKQ8D032iRj2/MCcivztNHtg9qV3p2Ojwiq
         NUiDpcYfjcYL5fkAec9zN5YhLFk2it2sbBsEPVeNd8H6BkxaZ+Kg4mFwsQO+/KeQFhTO
         T2tlkUY213Kalk8GruNvFwz5TTEgiACzeSDeO9fgwb8R2kWct8oFIvyTy3LSPNpTf2Bv
         zC2yogERFzM3vE0u4INP2TEFKaeavv9IsOAt1+fCvZY+DchB13SwlKJfSjr6tkpyjSel
         gUfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795296285; x=1795901085; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hMi5a02uE/uzSpXExAF4Lkyvu0CQTRncxuVGo5iO8pE=;
        b=ftKiXWlGPDVUxGuHG4qOqiKHu30D8fORLU9uQ6f6tDPgcsXlMC/0TU3u2vj9PHM6dG
         dcb4ZdJ1FsEao8wo0U63PFdQrzNRwNHUGbvuwtkD8+YMsUluA2uLNFOuW5rF+JPunV6g
         DrOhe+tlS/FXiS210eKUDLKhIbaxlQbD7p7oVUtNjcSrpDGfHVvFH0K4qV9Y7gIvv60E
         7jB0VflnHS81R6kBTA7OXuwQsBell5erbXE1AEu4RDkhwgnCKuwNufJydXXDO16TCEHE
         TVpqgma1eanUeR8lTCc8ttlhxmAJJbd/EO9m88xlKObOaavtAnthmPMYzG5T3vEjhyCx
         MHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296285; x=1795901085;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hMi5a02uE/uzSpXExAF4Lkyvu0CQTRncxuVGo5iO8pE=;
        b=ZiQyet+XPzjdHnvR+iugFYNwM9VmGVGoyhOUK9dEy0aFKOk4/KsgRm2lXxUQhEh6Xi
         YhGxHIX9Jffswy5CawKgzS2GYV3XGw1C8FBAOtmaljfjRI72X+YCt6ycczSnFm6pt+0E
         EFzJwtfOkfHW0bK5Lv8IpCMp4s2xdb5Ykgm+/Sb1P0xRvutL6N1qng2PmdiZPc3p9cns
         iCQGkSu+xK+YuUhNRRGme1TPkE7Fo1TGf1AjvJlI9sgTI/RCyakC/3WoI+t1y8EBLVKC
         GPp7M+kMdmtU96u5VLdYKx2Gx/eB0ySwqBr8f98yDOVp004cuXk9p4r4l3LXR12Z/H1Q
         +jtA==
X-Gm-Message-State: APuU4Z8rRAZCdWvryGkDrMuGW6OaCUYNhZ288Suae0iu+xRF1s8B6ayv
	NJwCt32mvJG2qKPEbyG4Vw9haA9DhZjsp8+U6ppTpUcm+DerVTIHj238XqBvzZuPf2Fi4DhGtLN
	71gVbJ6eTr4P8+GrEoC2R9LXjeWQQn14=
X-Gm-Gg: AZFdTZeLlY/B0ViyQYVJ/KtBJnB8FA0UarJKbOwgZ49sYz/+y15Zhx0jNLqSGZo/oOX
	MTlNSRqCZ2hir07E6GVuENL8mPlRF3MAAiCNJSasatzpFri9hVBqbnfEaba5V5EJutjNRM1IuVo
	aqPDbjaJBb5zIK0kb04/hO+rtSpqucy5YPcTnni55irS0QS6R3402xwUyojfynhcwDm01d86mkL
	KKjHL2fWTuOcbxlm4i2fWgUCPCl5BmPop951fGIaY5lt51IloHxRJ0Mr3gO6+ofLWNqCAp1Tj/c
	jLzpeA+088ZbDzWek7Q1LfzT1HXadcJCHTNpx9ZxbDuvG2nH7QVj6UFVjCX3oFxNlF8y6M5OgMH
	bgt9/iJh13uhcQ9CxaiNRTxXikYM/jfSmuyNTyz415ze1SaES5UWTyTTKd0NBGkLxiOj1nDqINi
	P3THdjvAtu1rKAmJHYPHDvIN5QC2vw
X-Received: by 2002:a05:690c:370a:b0:8b3:90df:6264 with SMTP id
 00721157ae682-8b52032cae7mr25129657b3.1.1795296285064; Sat, 21 Nov 2026
 13:24:45 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121001550.732679-1-ralerrdirsardx@gmail.com> <d4450968850aec1ae27961fd02db2ebb@tipi-net.de>
In-Reply-To: <d4450968850aec1ae27961fd02db2ebb@tipi-net.de>
From: Artemii Mashanov <ralerrdirsardx@gmail.com>
Date: Sun, 22 Nov 2026 00:24:33 +0300
X-Gm-Features: Aa3M54q9kplhW7kjX_69rau-XGGM01PK1RPQsFnA2sYfxMKR7JlxbekLik8E1hc
Message-ID: <CAGHp__ay+wa_U7ZeeYV9rOhfp+82SWCh1n_Xrr1Gbdosd9nXaw@mail.gmail.com>
Subject: Re: [PATCH net] net: bcmgenet: reject undersized RX classification
 rule buffers
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: netdev@vger.kernel.org, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review. I'll resend this for net-next and drop
the Fixes tag.

Thanks,
Artemii

=D1=81=D0=B1, 21 =D0=BD=D0=BE=D1=8F=D0=B1. 2026=E2=80=AF=D0=B3. =D0=B2 23:4=
8, Nicolai Buchwitz <nb@tipi-net.de>:
>
> Hi Artemii
>
> Thanks for your patch.
>
> On 21.11.2026 01:15, Artemii Mashanov wrote:
> > bcmgenet_get_rxnfc() returns success with an incomplete list of RX
> > classification rules when ETHTOOL_GRXCLSRLALL receives fewer slots
> > than the number of installed rules.
> >
> > Return -EMSGSIZE when the next rule cannot fit in the caller's
> > buffer. On success, report the actual number of copied rules.
>
> The loop already stops at rule_cnt, so nothing overflows. The short
> list only can happen if a rule is added between the count and dump
> ioctls - and then ethtool -n just shows one rule fewer.
>
> Fine as a cleanup, but please resend for net-next without the Fixes tag.
>
> > The source-extracted ASan/UBSan regression tests passed.
>
> Please drop this line, it doesn't apply to the kernel change.
>
> > [...]
>
> Thanks,
> Nicolai
