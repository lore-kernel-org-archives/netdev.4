Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794662622;
	b=CM8ybJWuUXFxHLWntg6+HOa/FjNYUd01C0ivVv+VEAEaXMDO1kSsB5kqHyXyWbIjdhfA
	 hSsNmtznLyJjPD5hKDL2IRcbjsuVDgDtZx0gCTaJ2rDMZsSj534i1VRckQ2RO7tLZwOzh
	 BRLBPKRpSiOKtidG8mAGmnIRmy6zNYnZGVvSIssJiJAWkimwEaym0uvIVcDqNnvxSfyJV
	 bc+GTXTpC6F6s9bsB3pAPlxFudUnnqE5DitgcTEaw6Tkszp3KOssg2gcHlWcMqnbosfSM
	 Z9k5S6J+56OCK9K6jJjjFhH5u2+Fz4hMSLQZ1HZ4XxPa+L8AnQoL4L4N/uhSkI6nozQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794662622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lrpvAPkDLqKwbdDWFpXF+Yv1YofzLjlvwu6TrBNSFkQ=;
	b=LY26MLvAoxOg8+SybYh7vCCORk4YkiwYTtQhxVwJJX7/iYD/j/vVlD5TBxq9E5yfor5G
	 sfHRhoi1R5fbwQbP1Tk2CpBlD95tl8zkfWgAEmGw0mzxae1Wp6hnWGrqoOR/JatdUI0rg
	 KK4gIF9OTu4n0SPab8LoInMCCBPt4QGnxeWQm6f39HbbZAMEB3fQSlHyMTbs4NP3e3DB0
	 piCZ8gMJ5l1D5cjzz1I+B5e/QXpxQ7gcsQq5PbEnp5Of3Gky1ZJ1+xzRUIIHT6BaPlzl3
	 YjNWRg7SRMlvHIRVb56NZejT6GtiZbup27cgN8gJtEM3AFE5B+OrqK6iLmd/Tik6hxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y78keFUu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C885606A333
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 13:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C885606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y78keFUu
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c506a231b88so302077866b.3
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 05:23:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794662620; cv=none;
        d=google.com; s=arc-20260327;
        b=Lzpi6ovpgy8R+uTPazwFDwlxeNeKwSY2oSAfVFOo3XCkyu/J6IcF8OC3wcFw0gJNlb
         aNze38bTq+LogLhJwOkiJSC91m6K5F244pk+KYS+1woR8I8ntXID6Yiq7qLfMSGDl8YH
         iqQpaDlxTTD5/XL2iB5WPwtHlFsLJaWCjrGfXlc18DFhMzgdNX0pPtfEeTl2X+gKaVko
         9CeFyyRLWMV1O/zjonpIRr109jVbEgfirB8XnkEXT7hD5rcWCdsptmDVLOTSsu0HiIHN
         5cYeATOGYqEiE0DduFijKLHpIgXT43lygTwiRyoujnQJcGrZeO0poKRPOwcgjFFZVxeK
         U5NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lrpvAPkDLqKwbdDWFpXF+Yv1YofzLjlvwu6TrBNSFkQ=;
        fh=OaaWGCtOfcHfvRWIMXCGSVgrI2kvfEgl7QLXACf6rx8=;
        b=S/ixlSuhXLOn7tN0OefWjJAwJHznF0sVcfkeYPpcs8qtvtsDWMcSRmq/yBNaHYA7Pf
         oHW3Di7DGjqNMVYrg3E88EXKoryW+ADA70r46Xl0P+GdATWvrnieAGLxXZrUewSuahkE
         bhHMadaxScUNZ9EJUb1Az0EuY3DuSGa3tx97eDfGZdVBNw7P9C2htaZTcDQOIB/JaAkV
         39q92VCKmGn1MQ1yIbgiEPYVMaia6MAiK2XqZ+FuZRSKE2uMh6bGbrbVqdw/rQhfqhjS
         ocXzTNDkJQdkLIOXT3Hp2Mcq1qpFROx9c8gbVfhSgga4j7Ix9B6HHubDCk5H4hEK+f2e
         U5IA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794662620; x=1795267420; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lrpvAPkDLqKwbdDWFpXF+Yv1YofzLjlvwu6TrBNSFkQ=;
        b=Y78keFUubWHygKWEUEc6UgYOqe5S9M63jeE5/qIveIYQC81xCdJBju3d1NuDQCLQ9n
         JX98VPtOMlVf/EENKgM1dP58zZik9ySvZySD14sxBOExMOY1du8PLgko3TeffbAHnJQR
         +xI96m855VJsq7cu01UqgtUq3m9cLzNoE4eF4P50nTrsx44uY7mMJj6/WDJKtAE3JQSf
         EuffLEZRjfDTCcYjxHAbAZ2IiYGvD4VFouBRbWNj7i5xZPaW5HUQZ8J839jjP/qBPEu9
         gJ8rvo6Yfj9N47jrdNOca91CK18qybgh1ZIK1O2nP6wCnj7Wf96/D7VwD+KaAQNdMqHo
         UQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794662620; x=1795267420;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lrpvAPkDLqKwbdDWFpXF+Yv1YofzLjlvwu6TrBNSFkQ=;
        b=iEi3h1NsiGMr4D/qomKnEvC64y9R6tYHr1i6DcVoua53UdZD28yYVv7aahc1HiMky2
         Id8Ux64ntPsVki/u3thXxwCqQyjfE28wi+uK4dGEX1plrJfk5A/egbTGJadwpSKCCTyl
         QqQdU7bQE8REIXTu9i3bAHW2MD/YG7+n38lQMxLtMoHvib8pFyRAT5hishNbbl3vdWx7
         rNPVVJfPHL1kN4CKOTLB+hJ59dvOZsdRitwEpT7jruBR/LuYW7XD3fZV8tFPW/ksT4Vv
         WfkQQszrzNx6FOSAnXPyQIItV0tP4VZLGuQotqRFjyV29Z5D7W4/Les3W4wp4/426asE
         W7AQ==
X-Forwarded-Encrypted: i=1; AL+hErEPmd5ncS4EUPY1DJpNwzSze6kRgzuaP/l1v+XnEdP8Q8z6xl69Ctbf9PiKpgn74w5FnqFGyg4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ljuMC6IVIcU3a5audumtSAK0e0EJz834vgl0PyHtTZ5yl+jMh
	EWuIpeFji2zihpJz8+toLPCG4B2wo2vXGVNOvUcKiV+ecNGjOkZovw5lQs5FWsk30Dj40tDr25U
	HpFeB6YY0hclV6TDCbwo3Na+f+hekvo4=
X-Gm-Gg: AYBFou3efyKDpEuU7tePi+6hs+GCtV5U8envVKRpCmAraLbzelJ13IXU9wrFfYDWefI
	glLLLGas07+Sn+M4ZSVgrafIlqbvWJkkbVR5uerp4Ndh1vYh5cawpTcprqv2U0InoU8g4UKosHS
	e6Z1V0dwJstZipBdmZCGrQSl530WWQlkBq0itgPJQy+/1Abpoufsmux1Ej+kqmVUhVxUbEl145n
	ADj7xFFtyqN6ys9Y2m6Px+2tzTh4V6D6TiANWLpP/wxsJVcyWQl3ETJcKwSyGfxZxMCo4vrc7hy
	QnCdDpHYFqSOORRWqMiFuxFF5+VuDeSZjA/Ea9/4WQ/B9mVK7tIeVKHpi7v2T5Snc3ESzypxkpT
	IsqsitAvFC6OAnYV+3dv6juckuD+dwtXR6jFxuA==
X-Received: by 2002:a17:907:8e08:b0:c2a:ad55:b3fa with SMTP id
 a640c23a62f3a-c50961d1e39mr552099666b.7.1794662620446; Sat, 14 Nov 2026
 05:23:40 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113110546.173624-1-a.shimko.dev@gmail.com>
 <20261113110546.173624-3-a.shimko.dev@gmail.com> <583c58dd-3587-4c2f-af5b-9b4a10fd916c@lunn.ch>
In-Reply-To: <583c58dd-3587-4c2f-af5b-9b4a10fd916c@lunn.ch>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Sat, 14 Nov 2026 16:23:29 +0300
X-Gm-Features: AclHuK9xmSYcy3iosLF70NipwjdWhG3wzCm_VjkuxjxD_XFGqVVFRCg6Padg4g0
Message-ID: <CAOPX746ENd5eSAAdhAy6fFdesZ=REU-T+CgcKtwpNJHY0Z9m=w@mail.gmail.com>
Subject: Re: [PATCH net-next 2/3] net: phy: dap8211r: add extended register
 write helper
To: Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, maxime.chevallier@bootlin.com, 
	pavel@ucw.cz, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Fri, Nov 13, 2026 at 11:28=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> > + * The caller must hold the MDIO bus lock.
> > + *
> > + * Return: 0 on success, or negative error code
> > + */
> > +static int dap8211r_write_ext(struct phy_device *phydev, u16 reg, u16 =
data)
> > +{
> > +     int ret;
> > +
> > +     phy_lock_mdio_bus(phydev);
>
> How does this not deadlock, if the caller is already holding the MDIO
> bus lock, as commented on above?

The comment is wrong, my bad, all three helpers (read_ext, write_ext,
modify_ext) take the MDIO bus lock internally.
There is the same mistake in the comments of read_ext() and
modify_ext(), so I will fix all three in v2.

Thank you.

Best regards,
artem
