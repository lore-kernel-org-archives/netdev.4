Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795051030;
	b=La95SHdvARtwNbx2H3brK2LtdPdXqEuAHYIcwbSnjT/pGS/pag1+tq4Uy/6uPiPsglxw
	 I2AlKgniNcN4j7Axpoh7BSnUQsjlCmcEB4Ypbcv6k+CQULXrFocqFC71GZu6krshIZ805
	 CDXaszaaiVgdXLLt8QzZ9NnWZW6RdzZj8fRcTDonXpELYk+8voLsJFUURBg4SC7Kkrxxf
	 tDMFwRC7wj0epNJmaJsQx4tmIGtMv7CP4vqatTMp+GRYandapOTAXtTPesY2l48AenjrF
	 rtmXdfqdUPbEiuJeOhGfnG98bDoe2UirBk3HeDUs37kysDxBs2sNeo7YbQIEZItX18g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795051030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=59Vn+6ZCrn4bkmigHbGhLn/ZQOyW7NScFiy8pChk97U=;
	b=re2N+ZOEvwALYP5BS2vweO18vQRSsIy1nopjOzBY9C9mig9cf9iF/XJ+76IGLNMSM5Oe
	 L3oemAbW1ptYdKWdinN5HTZHpWsICpdN5dUk1UcfOmgYF0qXmfsX+5GYHmDQ/fGllOS6z
	 sQJiuUmxc5/XLrW+abERyB+R3RPm0XYgXJZknafQQpbPjcGOUr2ZhixaOXIS12BAieZtv
	 IXcLOWOruRBlKYTnGMePN1x7RSBHrkaSsnfciNaYNzigjdKqdz3coF4QxMdTdB+uiwCY5
	 xQdKaZcxTHFrmr8WuKjDIUNh2NOwStqAWLG4NFNeZ2nvOlngOUc7kW7OtnP/9oFTetA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OodLDqWV;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB46606A331
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 01:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDB46606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OodLDqWV
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b3af93b85cso926851a91.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 17:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795051029; x=1795655829; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=59Vn+6ZCrn4bkmigHbGhLn/ZQOyW7NScFiy8pChk97U=;
        b=OodLDqWVLKJWRJ4hxsJ+0H/bezzEwzFKojs+r32NAdCAkVMc4Nwq1iDewob/8kYBUv
         JCfPxpSQ0HMUags40Mt1pFZ1Gkt1tkJ8RqaEVbemFmkZJsRHtcjynKb6UZI+MEUaKplg
         i+aQ5CLAjSvcZpVSNhZFAnuVWMV14aj4vhpSEkUdnpnygjvdVw2IvjbA0YRQMV6jrS1o
         clGsv6cndA8hxyP+N2tDp/PL9oxGHjp5BWXzOtscSWyHARXkcSK9Z526nre/f3kQDQ3l
         e7nAdv672XkwpthS6aIWB1g0G9K42GfA23U+7MqGA9SAp1oRKVgq+Usm3JkEr91+e0GQ
         6v6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795051029; x=1795655829;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=59Vn+6ZCrn4bkmigHbGhLn/ZQOyW7NScFiy8pChk97U=;
        b=ObvkCjjC/iBBzgx5wzsO0FIughR8GZm63OnTPLKFgro+GDG+64YfJIEgAa4kkbxoF8
         0BeBxNDtlGwuuw1XUs5XgnjqE9BW4PbuG5oUOgMVR2bHdXGI8OLFWOK0W795hQ0nsx4R
         iUEyjeh1fO13foh5RyKo4Lp/7MxIiGCwsmyF9WCmavjwwmv6dK0Hp3i3Ln+vtpu50O52
         F8hhZcYeeV8mmGWG7ju2iEaET51NXOAdhGwyOiwzSaUFGGAc4ajFqtbAkexanluih6Vv
         cvSr8stqJ4PuKLZj80cfF/rL58tjC78q9JtVo0r1vAOWuXdKW2vPxOzCExmtYMU/FWF1
         537g==
X-Forwarded-Encrypted: i=1; AL+hErGUVPuMTHZr106J6LbuGQWYfZe2tybvRsBt+0pPT5E5m3U2k+EZ/ZepjXRhqXhw9fv0clUl/30=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uP5cXHX97yiJEYxP+/na8GTLi5L7EjpVsN7S7zNX6oni1WGtk
	gYpnE/BJjCzT6W5hDi4Bk4mGg+iW5PuvoGbi+4pYOxMc2NtLBq6z2PZb
X-Gm-Gg: AZFdTZfTL/b5wcAc3dHLbjx8bNqV22TEtlUTk/pgr22LbuJEQ3WjLdlOlJAlF2QLemA
	n8tAyd66bBgko7evIV5GM65v3q2KXYQyEk/H2pkqVIu4TkZmYDBw+kGNrZD3hlC3F9wmHnON6Ay
	4vtjaOq+SWz2ajTPzwzmAiW0NdfOkvTMJQ3u91lkG8ERVQ3HeYu82oxZQaxpNwfn2Q8WHdZVrt1
	Uri1GUBjbhEEhXufbgAWEilRySA48cqtbq19e20hbPeBLEz51pDl+UkUVB62yM0LHzdNzOKGgld
	JwcZafHNaTCtvVwbwmt10sDtjFsD4WFatthnL+I3NRB3E/sq8rikt/SBNKFYf/6N/sclTB2BWVg
	h3jw7PK4k1IWzCXUF9RfTPDBTvUCOvJIzrH93oIS1621jDA90Yvk8gFhdd/oh5QuY+WBdR9eeCT
	qkoBc+IJM024t9x4G2fZ5ENQn+JAq0zVQW+mLEHr9nDrEglQLG6Nw/uvT2kEN8HJHerX7JhaxeA
	SIMwmiM5eMTFSiV0QaM4u16wqd560YgbHiiV0GYyWBkHJc4Us6UJOcGHVcHWPz1xdfg9/kDvlJi
	H6HXBMKcq8L+Pj3AewNftehYFy0StnSNZP/Gu6UDD/21muPorOCSi+8oOYoKFinoY/dsrSnTMHp
	E/8PndE/t26ieRGrhV/Z+gy7ZEca5DVO26Q==
X-Received: by 2002:a17:90b:3e82:b0:3b1:2810:dfdb with SMTP id 98e67ed59e1d1-3b3d07a85c3mr4591922a91.48.1795051028783;
        Wed, 18 Nov 2026 17:17:08 -0800 (PST)
Received: from localhost ([153.61.198.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b402981814sm107875a91.2.2026.11.18.17.17.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 17:17:08 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 01:17:07 +0000
Message-Id: <DMYSHE1LVD7S.3IT6CHA55HJGY@gmail.com>
Cc: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Daniel Borkmann" <daniel@iogearbox.net>, "Alexei
 Starovoitov" <ast@kernel.org>, "Andrii Nakryiko" <andrii@kernel.org>, "bpf"
 <bpf@vger.kernel.org>, "Networking" <netdev@vger.kernel.org>, "Linux Kernel
 Mailing List" <linux-kernel@vger.kernel.org>, "Linux Next Mailing List"
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the bpf-next tree with the bpf tree
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "J4f J4f" <shlomojune6@gmail.com>, "Mark Brown" <broonie@kernel.org>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <avzIz70qnJIA2t3x@sirena.org.uk>
 <CAE_LbwkvPV2-LJ2b7OCFzmWmBP-jfxeMR=ARZJvuF4RNx8M1dw@mail.gmail.com>
In-Reply-To: <CAE_LbwkvPV2-LJ2b7OCFzmWmBP-jfxeMR=ARZJvuF4RNx8M1dw@mail.gmail.com>

On Wed Nov 18, 2026 at 3:47 PM UTC, J4f J4f wrote:
> On Wed, 18 Nov 2026 at 05:36, Mark Brown <broonie@kernel.org> wrote:
>>
>> Hi all,
>>
>> Today's linux-next merge of the bpf-next tree got a conflict in:
>>
>>   kernel/bpf/btf.c
>>
>> between commit:
>>
>>   b7cc45994c3f9 ("bpf: Check variable-offset accesses against special fi=
elds")
>>
>> from the bpf tree and commit:
>>
>>   ca4395aade31a ("bpf: Walk each type once when looking for special fiel=
ds")
>>
>> from the bpf-next tree.  I'm not confident of this merge, it discards
>> the bpf commit on the basis that it looks like there is some new
>> handling of special fields in the bpf-next tree but I'm not sure that
>> overlaps with the fix.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>>
> Hi Mark,
>
> Thanks for the report.
>
> I reproduced this on bpf-next master: the rewrite does not cover the fix,
> the check in btf_struct_access() now only looks at min_off again. I will
> send a v4 rebased on top of the bpf-next series shortly.

Pls ask your bot to stop doing stupid things.

