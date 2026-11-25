Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795622339;
	b=UkfeFdHlFV8bTEiHZd+Zu3OJPX6q8t2duhmwwVG2qSHGoZEB2YdesG6DRUt2x9Xib1Ud
	 /3Qb3b33lRCvvabX2wmuq/Q1ZRN76nxbAzQt+Nq5vbOZtkOX+ZN+2QYdGFX31AwYZvDqG
	 tn2QSZxn6hSdrjnOmCj43tvfdSTeDwNkBIEEtZeAVzDb9REUou3/tEGpnkW60JDBhJrPI
	 Vh2JmcKJNZOUpc0oGpA+6PACkTaF6a/ps63xt2IJyfUSJjZhqnhCjb4DFzihbGODbO0fo
	 /9MB667PxmD5OdeatTx6+7GD7WNzrCeb1Ze7TuqH2Mdy6SYy3RwSIs4Ho0h5QkwtYag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795622339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6hnBZan8g8LHddmledKC79LHYdm87y2KXTgu+jeeovk=;
	b=PSMv2JvpZHT2AVCcNgr0YSDEHmU16YH2C+y4S14T9eUWoYphR8Pi5Hk2XkaV4ggzXDqZ
	 LrFc1HZtUos1ggxKeBPBbS+vC2QXMNNTZcdS2rst7KlcyNhSjxrnID1bfyvDTTB79K3Zg
	 arqM4wzoyC5ESAaYLlCdA7z+71ehneQzEChD/2obNMpoUEIVHdMZEvar3ZxRBldtb3ayb
	 szLDzR7t8xdzGJq1pdkYOCoPRyelcsdbB2jxesplr5X5CkxWYNVsTvOYkg4BvyMeoTXZR
	 1yLjnagdoWKm3lr3wCFc7J/fIjhyACEVngGdS7RarIQjZ94Ccw8hHZGPm38280f+hdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=JXLAQZKs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C41606A681
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 15:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5C41606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=JXLAQZKs
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso883228466b.3
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 07:58:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795622337; cv=none;
        d=google.com; s=arc-20260327;
        b=sLmU4HDsrxT4bNjxraOUXco3TaXa/WA9JsUF86QL+Mb+X1rQrtk00J/uhS5imHE6oU
         JUMq0fadLLAkMin2f9bvfmTKNEByci65EIX/TM5nxLcpNmHKycIN2kd85Jywsc/75LzR
         WLlfsGnJMUE9mcXHrwL/t0m1Tgj/bcWu1dAHt46s2qmC8k/dgj2XoRXCrAJ23eVQ6jE6
         rzSoKa7JxZTBpwCdKKXrBAjUWnPhmt0OYisteqhPMS6eEhx1bAu8lgquZzmY/g976m85
         D7UiLom/0g/gzwVPRKwAJcLGkddcjmEJoqXXs0hLJF+Fh+LjnCkdJDrtad6T9JAjbDts
         hXoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6hnBZan8g8LHddmledKC79LHYdm87y2KXTgu+jeeovk=;
        fh=I1odYHg2iFV3xm6CxpGCG2FDUtJZ9uikq9npElQ7jGg=;
        b=ebFeDv1l/21ToX3LFnGozqemUKjCCPkT/f4gPb9OYgN9IE9VEMnehSsb6lkc+u0X3/
         pPU+wOEhoiBVURWd1miOnOtSS/ot/hAFgqw7WUeL6opxUg0eHuSqGC3PRmLBPeyURJFb
         +JQzjdU5a17S6a80vWogHaEsysmzFoe3jojHEtkaRt0ce+3iVYDh9/cxHvzbVMxyYO6+
         s6fj2TQxZifrY6HMf3u1npnBXzs1WWgP+R/YSVYoYNtBM1FnOqVcN8BPgTwl2UhMfmsn
         H+Po4qO4iEQSODjgmbVe8Jx/u+BTEVWT0NLFVf06fn1h1baCsgytHewfLkcjIbfSclm6
         OuEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795622337; x=1796227137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6hnBZan8g8LHddmledKC79LHYdm87y2KXTgu+jeeovk=;
        b=JXLAQZKs1ZDSjHSAx8TIgEBbtDLNlVrzKhWV108iyq08/vJa1ZilyaW+VZP+C9p89w
         zL8opP8hxcFgBDsMLoaZdGv/ycXTCd9D3u5FVd31cobfbVoM+0NN860gnzpF1aHPqP0Z
         1T904onxOeVaulXCOUmlEUz2LZ6eUPQRX/I7KRCCBw4WxiS7VP61fBs5ayTosbbEMFJi
         RuOl6O/P7bshxQMQVs5WfjjkpMaHMF6K2g+KWoM+m7SVLOzUu2wMg9WPlnECrTX4gFmQ
         xnUjMP6E0k55etqDk9vtDqWlgcGYiCU79Jsh4pEptim8BwEAjAzmuiDK4eGQjGqr4Mug
         CwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795622337; x=1796227137;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6hnBZan8g8LHddmledKC79LHYdm87y2KXTgu+jeeovk=;
        b=EXkUAUTGezQDjX/NvoOC1rxBlM1cqrbbtJYDEAaWPJNaIwNM9fIJN5ir+PzVxyfgp+
         PVDOTUWRy5vpPGjdB700cmWCtTgBwp0Hpa3UdZYhNQYJ5zOkeaLh7hWK1svFdYjLqTvI
         Hu0yy1k9DcFje7yheJZKp6/LxfKAV8ilhExelQlEdVX+Qu3gWE1hgIAhdHioNWTQU0m3
         P3eYhwDdWHVqh6cbpZyqm1rtSEuNRUMMBTVmO7zfmQEpyT9bkR0HxYw5+T4QkfN6tBHE
         hn0D9429jt6bIyQnnfunI+75XJtdt786l8SemUGYaVmGG3qKUHGzUNTHIY9ymnOmsHY2
         2o4w==
X-Forwarded-Encrypted: i=1; AL+hErGf1Os9xXjgSG4I9xyZi202SZpWQ0NBcpYxtc8mrpG9fM9z0kKy8RF53x28II/mGhJIS0QwCIo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4SBcLWC2onsyVeFJkV1bC+wiq8PUnMIrzB9t3Eb0vodn+r2rc
	2/SHB99XoM/e2v59y92wVhHa3RNTUsS8Jxm6S2NEofI9NN80LpwuvAiwSXaXV4T+NMywyamt7aN
	7CCnZDQ+tG+lb/8M/cEhJoHMjBg+noeTg0cbjvMRPTg==
X-Gm-Gg: AZFdTZfxKl6kmKgTCUAeajhdl2sat2pEJWTTYiD87Nsyvj6faApE6H8YQkuIhqFlVs9
	KA2RcnPCIh1DeezAFhrYrrBnvbTz23iUsxCP96hhePuemDJd7/KWQ2L42yON7W2k4PZYRsHIxD2
	pSeGX3wziH2TvbcON16R8qrecOLNLrycm1L/WcBzSA9twKdK2ahelcaK2Wx9uujOl2iAEHlHt7s
	99wV8awCL/gMhljNY+QSTLGEWmHRgoKkQFts5Wq/nnOlkH1qscft9tS3wUo81vFhmQlMj8xnmi6
	yGkgdDr0Qu0nw0vUdfbEqD8oFmefKH2ijkNyYBvYAk/ZRQFxegHa+WzrIgGTumZ+Mgt437hIycx
	w+p9IGB3gPu9ZP9c7jg/A5KqIbIIXSaKJVtNFNWw3UcpJ0m3rNPPVKGjhztU8hHGuMRc2
X-Received: by 2002:a17:906:81da:b0:c51:1d9a:323c with SMTP id
 a640c23a62f3a-c513a88b0d1mr1175280566b.15.1795622337011; Wed, 25 Nov 2026
 07:58:57 -0800 (PST)
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
 <20261124-rk3576-otp-cpuid-mac-v4-3-d403b8a25113@flipper.net>
 <0aH4P5VH9HNiTXpCUTaTlvGaoUDQBnvv-0cSXtipSDkLOGjzGy96jDqsVtU0DJTWrocgoMcGFEgd0JUlF5mljVvCzGKVz4yUgDQ0s6HaDLg=@protonmail.com>
 <2f8da604-36af-4944-8168-02b046e97699@lunn.ch> <CAKTNdwG1sSBVKcKpHBj24nFCdc6WVKabV5=K4sJFucWpTLqRQQ@mail.gmail.com>
 <1defc5c8-ba61-40d2-99f3-6654f1743af1@lunn.ch>
In-Reply-To: <1defc5c8-ba61-40d2-99f3-6654f1743af1@lunn.ch>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 25 Nov 2026 19:58:42 +0400
X-Gm-Features: Aa3M54rEPfqgE6y_yyyGlUyi0QUCYRvYug-ToPvauBq7tha0wq3SQqIuKn74zqk
Message-ID: <CAKTNdwFktkMtdLW2GzqzLH+LO4kF0uY0jWpnvO5vbWmd-e4iWw@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] nvmem: rockchip-otp: Derive MAC addresses from the
 CPU ID
To: Andrew Lunn <andrew@lunn.ch>
Cc: Ryan Leung <untilscour@protonmail.com>, Srinivas Kandagatla <srini@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, 
	Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 7:23=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Wed, Nov 25, 2026 at 06:41:42PM +0400, Alexey Charkov wrote:
> > On Wed, Nov 25, 2026 at 6:21=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wr=
ote:
> > >
> > > > > +static int rockchip_otp_cpuid_pp(void *priv, const char *id, int=
 index,
> > > > > +                            unsigned int offset, void *buf, size=
_t bytes)
> > > > > +{
> > > > > +   char cpuid[ROCKCHIP_CPUID_LEN * 2];
> > > > > +   u8 digest[SHA256_DIGEST_SIZE];
> > > > > +   u8 *mac =3D buf;
> > > > > +
> > > > > +   if (!id || strcmp(id, "mac-address"))
> > > > > +           return 0;
> > >
> > > I don't know OTP drivers. But to me, a function called
> > > rockchip_otp_cpuid_pp() which does not actually return the CPU ID is
> > > architecturally wrong.
> >
> > There is precedent for this at least in IMX [1], [2]. To me the
> > interpretation is "Rockchip CPU ID used as a MAC address base with
> > offset X", which is exactly what the derivation does. IMO, this is
> > less clunky than the alternatives (e.g., a custom NVMEM layout which I
> > used in v1-v2; a "virtual" NVMEM driver referencing the real cell and
> > returning the processed one, which Ryan proposed in v2 discussion, or
> > caller-side processing).
> >
> > [1] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/nvmem/imx-=
ocotp.c#L224-L238
>
> I would say this one is different. The cell specifically contains the
> MAC address. But its endianness is wrong. Nothing about CPU ID here.
>
> > [2] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/nvmem/imx-=
ocotp-ele.c#L115-L129
>
> And this seems to be the same.
>
> As i said, i don't like the concept that a function called
> rockchip_otp_cpuid_pp() returns something which is not a CPU ID. The
> two examples you give ask for a MAC address, and they get a MAC
> address.
>
> Does nvmem support aliases? Can you put two different names on the
> same cell? If you access the cell via the name cpu-id, it calls a
> function _cpu_id_, it gives you the CPU ID. If you access the cell via
> the name mac-address, it calls a function called _mac_address_, and it
> gives you a MAC address.

The cells themselves can't be aliased, but what you're describing is
pretty much what the current code does. The id field is exactly what
the consumer used as the cell name when referencing it, and the
postprocessor callback checks whether it was "mac-address".

Shall I perhaps just drop "cpuid" from the callback name to avoid
confusion? The special treatment is only applied to cells with the
compatible string "rockchip,cpuid" anyway, because only Rockchip SoCs
use this particular algorithm for deriving addresses from cell
contents.

> That way of_get_mac_address_nvmem() just works, so the MAC driver just
> needs to call of_get_mac_address() or of_get_ethdev_address().

They still need to relax the size check as done by patch 2/5 in this
series, because the CPUID cell is 16 bytes long. Srinivas rejected a
prior version of this series that attempted to return cell contents of
different sizes depending on the use case. Currently any cell size !=3D
ETH_ALEN gets rejected by the net core, not just < ETH_ALEN.

Best regards,
Alexey
