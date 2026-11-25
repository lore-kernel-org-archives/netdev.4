Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795614918;
	b=n3G/sM6mdsNwHHWX2KDWBMv95BAR6NKISdib5nsJiT7+fm/dvo4QQAULxvPdABJe+I46
	 ULjoIDoSACuy6pqHi/AoD0NkAeOS1eREhLLAXuGts2Ue79r5L1+kp2CnKXpwV3SvhdorX
	 lkUH/1UiR8rZ2U8Dqa/gpxICUHWp8LQypv/FHyt/d2JHk1yStOBvRqJEn/TaAe/3++XYl
	 YnQ+Rbj1nX0AVn36XJbyePRsK4SxqPADOnM1QXpkPBF2I2jbMNDFLpjYNfI4fM63JU/sk
	 HKj/Czk/AYRMIjWvJ5xd2bX6z3SGJs0IIDZ6nGPzJZBJCYSkCrbo6B24Oysh1BzY0JA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FCuANSuXIYamXWDtNf7w7lG6eHXyutyXEO9DVfxIUGI=;
	b=oD9nYgfNYbSyo+74S2Ck1EORvzmk9vpaSj1ONoI7ntQVE0n96tJmdqKrNmcQCI0pkGFN
	 Ut0Dj7/qumXHT1PvKMHgnghE5JhXOodwNVgjbwBWUOprEsTsvyPU3eFM6lLiFPLJtviSj
	 +oBzp0jWLJjLFJBGd99QPQLq/RJFW20lxy3MbiwoQ5YAjrDiFQQ3z15pMgKKzVsK+yHSI
	 J1n20HCXb2XvtY+qoK5RDnd3tqx9/mdtsLvSX6/rR1t7CLGzBU72Tx/8yLxCH3JyT/IQx
	 x3Apxtp8v1CWgOV8+Osg0YXjMQGCvog/iHjQWu7ddm3fliLbVRtfH4Dtj2w7M4QX4Aw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b="s6M/SDal";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0F6606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 13:55:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA0F6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=s6M/SDal
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso1110302766b.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 05:55:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795614916; cv=none;
        d=google.com; s=arc-20260327;
        b=XlKFILtq0cbxfN0sjS0z+N4JK2R8G+9pyHaRyaN7qzZY3W0+F/PKs3zYkgZZNBNKwe
         Vfdq0kOqaJKc5lpfjlo1rF+pLIHjfCSjGh8u9g6QUF78SDnLJgpbXHMopQZiTtinLQgi
         OEYZW/eJCO+IiraHi+Vn5VkYZxiYE1BxNAlwuc4sNkU/rKq84Jvjxl3oo5y16VrixPJw
         lYp3zp8Cy96Y1GEUWVAMYK0aRrTkU8OehNe+C2ySWJOXpcQQuToH0gTJlL4xazxS/3wU
         Kx9XG6gXyg0KuOwt8k5WPX9UPbhaNC27YbKo/dKGch86ecH2gko1jOlAxt2CUuhVViVJ
         O/Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FCuANSuXIYamXWDtNf7w7lG6eHXyutyXEO9DVfxIUGI=;
        fh=6BvBrIzhhS7hTFn909vXtbbzfR4jAtR1jxNAqfZW7uY=;
        b=iO8l0H1ZpcCCkWGUWk5R7eKvlujiOV+wQ7ruff/0GzgP6kS2UdwweBokeAl9g4iZqM
         qkTZJ820RcxPdi1ainRooV+CjSRgDDGImJcCXYXg4LfvO2qk47+nqUF6cc/4Csm9K0lQ
         LMz5l4elm251xhl3ZAM3XBycJ1CHY08TAAmS+lcx3EPMLmGFA8Iq0O9xz3cTNVawKsnf
         MEChFMSmmqEgeegFhh8dJI69NK6Wy7QopSPCyh7hhuMZItSDV12LZJus4q7DhrovhEK+
         Ol7WKGrKMsVrbS0RnZLYJc1CB6WESjQan/EKSX8QsttAA/CYfKDflk1NWqgNEFdqNXCE
         un/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795614916; x=1796219716; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FCuANSuXIYamXWDtNf7w7lG6eHXyutyXEO9DVfxIUGI=;
        b=s6M/SDalISUI+jHyF1ygvsSJMXSzjcqCmvFuiNVEBqojZZqJk0awSxIA+xKTcFGZAg
         5PuEJlfkmW1iIPTOzc8HZx5zIx/PbL4NiHhDaxPQgE02vkGvH9r/JpOB7eMQDd8xb+Yy
         jKfzzwex9hReuI3uPx7ExJ7Akd3T9UGzK2V6LwBQwvQaC7Ybz8HjdVvTojvo096o5x6u
         I9kLHc8YxNpkEIXaNvShw7u90i/sMbVsdkfOXOeF3HfUe8Gp4ZcCJCmmzGvtqunMqrQs
         AWomcXaWWanscLtu8670AAkTPyfDJXcTOmKPn8shjYR28fEG29qlUU22w4QDNcHb3vRc
         Ddgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795614916; x=1796219716;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FCuANSuXIYamXWDtNf7w7lG6eHXyutyXEO9DVfxIUGI=;
        b=NbDKvMV+L3LK5jKmb5ZcqGkpIkKqpNRBj7kMcHRWAJOY/+wy77sa+3P5HJCx1ZfaMU
         5aynbqZ6qZneV+I1846LzIsTF+b8sO6Z3IO5cigxlAQyTIePt/QZunWbiQbfi8+C1ppQ
         r9r02JWV/3JaTD1BeSapUiLumXuTknpNY5E+G6yroWD6Yphnxe8kzOm4qO9lw6/acaxM
         L6r5yXN6TKTYjlpFrMP1/IhfQA0ZjO3hPFM/zSItue5vaA0RPprKEqGyh3bM5PKrkyn6
         uzpn9plbo2ikhzWlZ+2Tzc4xxr0NKC7GAfuVnWb3dPzw6iuNkXtT8zkkSspbCQxkeFFK
         Z/1A==
X-Forwarded-Encrypted: i=1; AL+hErFA1qGAPhx+zOQvAmZQfr2Tsus1f9K3BOAaM0kZ+xuB2edzh9pKq2YPZF462uHY85Aha+u7pXQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z95+td1lCoCyID6QJiStNol4p/+byV92Jq+p+737VcEAOr9o9pM
	kmgdpt4p26NVe+EWHZwOMWJss0Ov1Gah4oH7xHuED0wLHQ1DFNvAHd29ktx2VCtyr5GYpr4OVLE
	71F40qxixshrBptoyG2ba3XiiSXi7aMEwl19h3sFcZQ==
X-Gm-Gg: AZFdTZdDdSbJi2kbiHTI+oKyCAuyFes16FKp4+8gFMSRzm3DgFxIellIj5iBGaOMrs3
	uiTR2+dOaLqE/GQli9QkptXPose3/gjx+8hUHyqDJcxuB5Ng7QH+Ik8skKtWIkRpgaZg5uF00VX
	pF6JLvnDgNQ9JElh28Sn7/GXet8B2Jzw5RYYNb/bFW1qu3uFERE+POfy+h/IPrCckGahvjAQfzA
	hAE7y5WEkaWufAkrkx+6WGiYP2bH0uOtBTcV5ZxNBhX6B9Tj5uAwyNuKr8lS0cfFh+r0ufzHQmG
	OSsPI7eNEmzCkH1ZI5H4bQqVhALiUsM+8EUaJ8qnB7FgL3w9CScIHwu34MLIzu0R3eSjlhjzUx7
	ud125QOr1meAWfHaCX6XI+yNaJuRFutYL34l5fotmdAFCUhjx4G28ew==
X-Received: by 2002:a17:907:6d26:b0:c51:50c9:741c with SMTP id
 a640c23a62f3a-c5150c98208mr1275142566b.10.1795614916108; Wed, 25 Nov 2026
 05:55:16 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
 <20261124-rk3576-otp-cpuid-mac-v4-3-d403b8a25113@flipper.net> <0aH4P5VH9HNiTXpCUTaTlvGaoUDQBnvv-0cSXtipSDkLOGjzGy96jDqsVtU0DJTWrocgoMcGFEgd0JUlF5mljVvCzGKVz4yUgDQ0s6HaDLg=@protonmail.com>
In-Reply-To: <0aH4P5VH9HNiTXpCUTaTlvGaoUDQBnvv-0cSXtipSDkLOGjzGy96jDqsVtU0DJTWrocgoMcGFEgd0JUlF5mljVvCzGKVz4yUgDQ0s6HaDLg=@protonmail.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 25 Nov 2026 17:55:04 +0400
X-Gm-Features: Aa3M54pv9ze0w4z1urAY277TKJgQi-9HwT3ngn04WBh3FoiAC5gcBe50J9g0GsQ
Message-ID: <CAKTNdwFwuG9bWStnuttiXY0o_iqMX3Eu_0DhFtxXt09Bp3Dz4A@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] nvmem: rockchip-otp: Derive MAC addresses from the
 CPU ID
To: Ryan Leung <untilscour@protonmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, 
	Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ryan,

On Wed, Nov 25, 2026 at 5:49=E2=80=AFPM Ryan Leung <untilscour@protonmail.c=
om> wrote:
>
> Hi Alexey,
>
> On Tuesday, November 24th, 2026 at 8:04 PM, Alexey Charkov <alchark@flipp=
er.net> wrote:
>
> > Rockchip bootloaders derive stable Ethernet MAC addresses from the CPU
> > ID in the OTP memory and patch them into the device tree they pass on.
> > Kernels started any other way, e.g. straight from the SPL in Falcon
> > mode, end up with random addresses which change on every boot, even
> > though the CPU ID is just as readable from Linux.
> >
> > Implement the derivation for cells marked as "rockchip,cpuid", handing
> > the result to consumers which ask for the cell as "mac-address", such a=
s
> > of_get_mac_address(). Leave the CPU ID unchanged for any other reader,
> > so that the same cell keeps serving the ID itself.
[...]
>
> Perhaps "rockchip,cpuid" could include a mention of "mac" somewhere?

I deliberately avoided that because, at the hardware level, the OTP
cell contains a CPUID, not an address. The special treatment applies
only when the CPUID is used for MAC address derivation - which IMO is
better captured in the binding description. Let's see what the
maintainers have to say though.

> Tested-by: Ryan Leung <untilscour@protonmail.com> # RK3528 NanoPi R28S
>
> I tested on FriendlyELEC NanoPi R28S (RK3528) with index of 100 and the M=
AC address was exactly as expected.

Thanks a lot for testing!

Best regards,
Alexey
