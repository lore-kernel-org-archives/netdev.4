Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794633517;
	b=g2VLZjh7F0sxcMMhbdbAzndFVPw6bGtQrGOOqual1SvVxEC2/gV5Zm/cybvN9TzIuWbD
	 pPSUu7qtAW6NyaW4uBAdxNLGELp3TRTvTgNKSdkielzxpDECqg9agZLBvWoEAxIBmDvol
	 K/nevTXcw+LSkFdfL7E5B9gjzMoz9wSkMsUQC20IIT/xh8LyezDPGx85OIUVOxug+NOiX
	 xy5/qvQTBbyg2RP2ifkg/QeaHTgfr4kInjCnYFlO5//bfyxofN1x2k5xiwqHLALvJu50y
	 YoU/iq899AC4rU9NGMVnDViVou+hoR8WaOvxe8KhiXtWQ+37PJi+h7jKtBmr9sH+2sQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794633517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QZepFGhbJzlLfvq9xOUY5XlSYHu4zw+0b86yQizHsKk=;
	b=hJHCeOsymiijYYasPCMYt+RZgDZlc3ciYEKyJ1jvsP+NagM8XHkNw6DBSi6CmeOKnESc
	 bxuQuy2+rGf0k2ODTmpnRAtFyenj3H8Ve2be2xPbbraWU8mRYDLgUL6Eqn+EagP0rlXjo
	 ah7X28WiJONIAgxaJFZqurkPmYqFB2p5ZJ3ktzIGLhoaK3fNaTEvmgeBem70/FGsCkwLD
	 BEeXIpxNJY2GM+BRCODkc+P7xMaW+MCXrmyWki3eHW7mWd4yICRcypbIu1dmvMHbw4zt4
	 UOIBVVqVEuZh95AK61yMvNDeX41EoiSTWSbLKn3W5+qvSjpf3QPckFUWzjVNDScrwGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tt09t7lG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F93606A329
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 05:18:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74F93606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tt09t7lG
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91eb449364cso31849886d6.2
        for <netdev@vger.kernel.org>; Fri, 13 Nov 2026 21:18:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794633516; cv=none;
        d=google.com; s=arc-20260327;
        b=GtAvwyFut0IjpKHivesuAVbKyCkHKfiAa4xdEPSEvUrKSCvPplCXqRt/06Zx/6OEZM
         mjw7RIDmIXiSRMBNy+liALc/KlJJBBZxE0Ra3pDv9xJqxfUxxa553N+r7Rei1cuymkNo
         vWa/85mm1GfaDWWPDdhe1YWhKl2V4woFj018ShOT0DZau6ixF8tWBZFyZ1UKHPypGXJr
         MHbYz2X2hIlLHzu0CsAzYGOdQj2gpHCX7vydeGso9L7m0HKdgyG9Hr0RDwXvx7xtu81/
         xgox8yoUoWZT+d8YDNuaiBps/XSZ8BQm9fMZ/xK5DQe7L6jaDNeFPIkpEIG4QHFnzTZ5
         Heqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QZepFGhbJzlLfvq9xOUY5XlSYHu4zw+0b86yQizHsKk=;
        fh=xRqbFiMXH+vo1cOQSGIIhVhNEj5DrggyPuX9xxnPePY=;
        b=XtbbsBm8K6El9JV1HoiQ1CKeChDGXGR/8pM9Y2cawp+VjPJQRbGWM9n7kCWMVeo5dA
         qO6kMRjkUzmLQHmRmUyrTsLbT72WBcIbnulJad4+GEiOeOw1nZCl2cy3wdNnil/A/RYT
         qfIEKuDTMqyATK932lS1vm0CD6TaLum4VG+Ee0bfmnROSqyO6f6cgPykom5Fn1XQ9Ca9
         +c9kx1ZK2jxuimGp8QBK399kkrP6mk90DPr/gEwAvdBqWdCvmQqHbory+d6DV+thYp98
         xowgkCN+cgTPDQLviXNu2EufwwmO0qeJEiSA1VqBDsv3h4T+CA+L8A40uhHSBAp+Hkw2
         CBQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794633516; x=1795238316; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QZepFGhbJzlLfvq9xOUY5XlSYHu4zw+0b86yQizHsKk=;
        b=Tt09t7lGscB0cCnQBYFBnRK+bJZYgLQoIndD1y8Z7jDoxkgW3qQBBJEvdGU1awSTkL
         znAq0qnJ7Pog7Rfv9H6rKYJy0JmhW6mCJsyoB+DOV8C7kF7ynAwLgPrP1AB4OzDROM0Z
         QyOrticqVumIPgkAEsQ4kVm5mC683TimDL4phYi6hnu/3FBkgUhFk34mnomc62KUDq8m
         uzl6TVHuiePubIUqOviFouPNp+3szljKc/TRlyTNQbdWT/xz1GNzopc3U7/fEms4VcRF
         TzJ7MInocO7mb0/7AKszVp6f8/YdMGuwY2cFm3ajYwYCkrBK7U6+Yo8jECblJ7Be1QOq
         1hZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794633516; x=1795238316;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QZepFGhbJzlLfvq9xOUY5XlSYHu4zw+0b86yQizHsKk=;
        b=o+bk4Dh9EflKdIVyYBhwkb9yYxvuFmP7ivEp4k4xxZgEJqgtY3T3xOWEPY+iKY0X98
         3Wng7DSusi4TzHJ2faNYfSwvOhAExtynhPzUZro0ieWJRdNniVX0QCaELMVASDfJc2UC
         tbwLxzW6pZqShty+HQd6ONb7TbzLZe1KbyFBaOWMWzum7xdgJgYfGCwBUuuBs6bBPkPM
         Xb+vRay6xAflIgqH04MPscdhfxk8bMwV4BM1K51JgvaPhOlmfBZtiiAq20PWaX3dTFrN
         toXMA7LjgrdteefooQDgHh0CI0UUIfzmkvEzcEL2ncxnZ1rGZxp+bC0GyO7BaiYxT9Ea
         FetQ==
X-Forwarded-Encrypted: i=1; AL+hErGonKqXJcsGthTxGh0QpCyAgYJB1k2Z/GPYu0PL0e1Hp4kNu6cWFVGE0yl1QxzCCbQKaRzoiP4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8M3nQsNH4U/aDpRqfbTQdeSDFa7SuUHyWJ+lw307pkuIw3PHeH
	JXvgO291kTwkUpdjq3oWBhXo8eHDcyXuIlvsbWKgwrL9JI1a+kon8E2Jf3D4KF3213TrOa1yOSZ
	a19UsiVGrqQ/iTnTCEEcLeOv+ScHpkSY=
X-Gm-Gg: AYBFou0KiZc4ZwMkEI99mJ9UxYdbCzuLcz5TPUMV5NOazgXHr+tEM6UvwLzVj55c1X4
	RuvL9t7NABPW+Rfztkk5C1S5zcI9xAAFgrgIdsTEBY58sxwcHDg7UiOusA9DkCzL/d1jB/PvXbc
	XNKnfHQfQJ8dfuWWrVIEIow3qoxoe1lBdOpM7TNG3WPLsaDvKl/bVrs0FYehVRDwFQzr6qcCWwp
	goLniVrLO4t4LyGfwJZJ6T+ODmbcT3H+9c7tx3BB704xXWIY5kRqhQJ5zzZgvxNsAUI40zM0tjv
	eRG4rW21b8GT48IHSnKaGqc30ebXp8GO6HyUmoXc+CWmz5CC1Fo7qEJebrgC7CoMxwHX+VkyCXH
	1jVAWVVj2sKZ4oT6OcA2aS8Hruwr+WUG+atQhgF9SXSVjwrDVJzZxLDH3nQ==
X-Received: by 2002:a05:6214:1315:b0:91e:9693:1dad with SMTP id
 6a1803df08f44-91f2418bbcemr76958436d6.20.1794633516437; Fri, 13 Nov 2026
 21:18:36 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114050954.275495-1-artem122novak@gmail.com> <179463314815.2168702.3601648779918603836@kernel.org>
In-Reply-To: <179463314815.2168702.3601648779918603836@kernel.org>
From: Artem Novak <artem122novak@gmail.com>
Date: Fri, 13 Nov 2026 23:18:25 -0600
X-Gm-Features: AclHuK-ysfMO1m51fCmYfB7QkCzo-oPWNJOqR8JONxvHDkoWVwWrsjmRva2E1u4
Message-ID: <CAPufuha49_gkJxbLYrc=3OtbeFd6MMUSuuxEznDBnA+hDTOfJQ@mail.gmail.com>
Subject: Re: [PATCH net 0/2] net: usb: smsc95xx: propagate MDIO errors
To: netdev-bot+sinfo@kernel.org
Cc: Steve Glendinning <steve.glendinning@shawell.net>, UNGLinuxDriver@microchip.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Alexandru Tachici <alexandru.tachici@analog.com>, Andre Edich <andre.edich@microchip.com>, 
	netdev@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

The issue was discovered after a kernel panic on my Raspberry Pi server.

I investigated the failure by inspecting the BCM2835 SDHOST driver's
DMA preparation and PIO fallback paths.
This led me to identify that when DMA mapping or descriptor
preparation fails, the final scatterlist
entry remains shortened after space has been reserved for FIFO drain words.
The request then falls back to PIO with a modified scatterlist.

The patch restores the original scatterlist length and clears the
drain word count
before returning to the fallback path.

Thanks,
Artem

On Fri, Nov 13, 2026 at 11:12=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrot=
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
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.
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
