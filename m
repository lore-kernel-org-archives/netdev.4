Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794922888;
	b=uetwqgDSHGBZ9xDWooeXL4pR8dzszsa2OEBZoC9vViR3/i36parah9AmCgE/FXqP7zxS
	 hCYE0T+ja8X1mzlp75m//VkRxjOTlj378R2stWIYOXBPyVbI7WET6BRZS2ghNYo3lV3AQ
	 JcXzRDJ8cNBK9x5nVPQvZ3GfvTuc8NY0mVRhN0VoU397HAt5LjRoLOYwJ1az912xiN7Cz
	 CjpG9ZOn0l9DA4n5YNEYkYrJg9xdX//HZcWvJid1MZuNP1QoPuGLNziiBOojOJR27xj39
	 VUp3K1I9h1RvrHGilH47tfQXC7/OoXhaQVn7puIULA3tJ0d4JE8Kgk1hNE90oAL7+pA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7Wpg3cT5I6s6GnyI0QhfON8nAL8HSLyzxKK2eKgU8bw=;
	b=L/aEcIFsUmCWpCts22CO0ETmkKK2atNP2sJ8UKuD6nHjp4gsV6+vcGOmgTYGoD6IaMD3
	 VzEKWyfe60OcOjOMAVqJC0xoan7dri6GNH18Ld8L9UVWZCTS82sqidPsSr02e4l2HC2HH
	 9zjMdEn1cir6S/mqmmiTdrrfmeRKDH54YTGYkkdCS/jMdau2SZUNQg9QE5Sa2bpkFqsFu
	 yM0csLw2VejGSYxBj0W048pLVz5d/WCyy7iNmPPvhOxK7JEdKC7R2Ia/eoYS9yCv/BJCr
	 Zo7pDeJwHnPG80wyuOmLCH3QfVK92sWW67d8KPOhBWA+/UHsSjrJr/PBn+2ib33ggQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HXZD6+bO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2AA606A33A
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 13:41:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E2AA606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HXZD6+bO
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b75712fb57so6017071a12.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 05:41:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794922887; cv=none;
        d=google.com; s=arc-20260327;
        b=q7/cD9VLwcgq9R4WYLj6Nm4m1xmxem0hyjXlpHFpG5P71tCvpjRAQ0hzt+/tKJOTGW
         6YI5qQ0RJZKeyhHEUZRslOMusn3o7FFpNjMkAxkAnivjhhNRydm1Rf8n+scZ/auxC/YA
         6BGTZlYJI0RzxIq2xOJZDU+DoESppAwwfoCzHx9euYMig3Dcl/0Jdvn07H+MEjx7/ddt
         Qb5VGaZUcwoSMCdls2aZChm7dDdNkayUjJNNtOTkv5Jh7UfBLbAvYjybWHVbwXG+Jj+M
         baf8gx96SlEfeCOghUuIydwUlhBqvtUM8se3rU8p12hDx1LHMATzXPyZuh3noHWT0jFz
         eQLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7Wpg3cT5I6s6GnyI0QhfON8nAL8HSLyzxKK2eKgU8bw=;
        fh=hbHqMJA39kpypZHfHiOApbI0C29yeFy6y+2PKS/czBc=;
        b=cxA6Fv5TgRy8pxEEJEzXuFWwOh1qLXaHeu+Z61NhOz0V/7btBbbSOeOX6E5/el8TXI
         VN3Cq45E/b1wDH9+d+92KJ/OJdFxVgAwa2DUmQNDDiSpfvNQ8nt5bEWE0fNIZaFfAk4G
         178wFpnUTjYdYNYxvFETV2El+SAbcdRUu+eVlProtXnPd/5qsAUXE3hc7TSMNHbUWd8c
         6U2tr65Wb8Xsj68QXtyAgER3yKWr8hBqFcX401GuBhu2/f5jsVDT3eGmLcDgh0XbAXqN
         IgAf0njf0fc3ppU4wsNNbBtKeF1+VfqoU6A9COi8I0cDkCBT2sl+84GnL4b8ple2RJZp
         eJmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794922887; x=1795527687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7Wpg3cT5I6s6GnyI0QhfON8nAL8HSLyzxKK2eKgU8bw=;
        b=HXZD6+bOfJsqVWxCIDhCrOX0w0tZU6Qb/j1uDssVapw+Ww7+0R3+poAelpj8hd30Uk
         NRHXrhn4tct1eSaoNp46WjRi+tv91i99TN22b1qevYVL8cvYI0iyYdiFa5yTKzolgHGk
         8sMne0X5x8cIw0Bn+YjBIpGqXPeglmO0o3KddQI5WHKRGiS6xUDAvsFwtqDTgSDDmUSL
         MUkHm4nVBccOcAud4fo/vDh8WhsTW0pzO74y9BjVQkHMK8lO86VC/EoMAjY/vl22CH/Q
         ECbYDcJOPfeAOCjCZgumewFmNWl431+UgM8dmy1CPsxOhFPEuqJuAjaGLdXJ/yTGpMMN
         GXlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922887; x=1795527687;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Wpg3cT5I6s6GnyI0QhfON8nAL8HSLyzxKK2eKgU8bw=;
        b=VpvYLQwj/9nRRCk4MEdY6TKcq4q19qltHAQ0slRFaaLtM1SzSfp9bnI43x/mt3Sp+b
         AepO4Eu2u2/0I+nLoxVld/1ciqXjeB5SlPVD6zNVpbCuwgX8nSrZ+guJddNSpLbt1dP3
         oRv3/3Yp2DG0OXyQC2Nz5WUEkzM7cVk9oZM7omDy56luAcvyUy/a4Fq8VyufZqW0Z0XO
         sozcIJgwD0TCe2howNXOUmcCnpPfdHXyMy2RxDwVAPHurendFF+75iAMQsKpUHTWnpCB
         zn9Zms4oZWBLLF76DQl1/LYgXPud9HY4Ri2Vc2eTyT9VMwCZfM2npnncRmoUOYo88qfu
         LbxA==
X-Forwarded-Encrypted: i=1; AL+hErEzsUMUy7tAh4PqfKEpK8pL5+TdtXMjvOKNWKcxcyPJ0DxVZk5Ti7HQ3bXPs/N2aSl7oHDLVcE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zw/zmyBcxuXdS3uxMZYw6P+2jCADf65rVQJZGUn3jcE0mzz/c
	9LQTDn8roWae9PvPO0aQ+4dnganV3K9Z7AebxnU+HujkC8MdNyDxXwlM77I7yMwQ37YXyrTZ8/J
	sxb5BwPd/+WJQKbeRRVbgcDFbJyb89HM=
X-Gm-Gg: AYBFou1hmEpyi1bBm23fX5wVinypK8fNraCB9iAJwbci42tRARP3CQNlv04Mg1jU/Ho
	E8M/b24zUAz0ChnITdiPTnrM9GcaQYk3/eWJFKk5Dj9A/8kxwRy1cysYZawIgn9+JsnjeTBrnun
	hqbNhCnGYbYYAleHH35IPFNfWwbXaOUmJTownYdHqnqEXbQw9r1etjwxza7t/Gws5FSDV1wy7wa
	5jG81Ytrmf+1NAdVIR9eQR/DLjwOxotSCbE5uYFRK4pqILjsVtKd5gNlkamIwgdFwEobDmvVcBV
	/0hZdQD/e0NgEsquSahsqKH/zUypM9hZB9uAyCO4fD6Wn9RfO0G5ZKZ8ockapdMmrQ4+iBG+eIL
	2ZH+nSYHfCe1Dk+jepWVH7wr1Q4oRrOv5JrSfSQ==
X-Received: by 2002:a05:6402:22d0:b0:6b6:966f:28c with SMTP id
 4fb4d7f45d1cf-6b7c0bbe6f0mr8200959a12.11.1794922886352; Tue, 17 Nov 2026
 05:41:26 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
 <20261117114432.2794961-5-a.shimko.dev@gmail.com> <052adff8-b1d4-4cf2-941c-cfb2725d13a0@lunn.ch>
In-Reply-To: <052adff8-b1d4-4cf2-941c-cfb2725d13a0@lunn.ch>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Tue, 17 Nov 2026 16:41:15 +0300
X-Gm-Features: AclHuK9B7NyGEv7s06EQ-PBXvC_X_ioRVUg7CDZFlHxN77tZjCz1y9ac7S-od64
Message-ID: <CAOPX745DQDpYh=PNQxDkH1DbfwMRwD8DV81TaX33mNk-9aX3oQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 4/4] net: phy: dap8211r: add PHY LED control support
To: Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, maxime.chevallier@bootlin.com, 
	pavel@ucw.cz, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Tue, Nov 17, 2026 at 4:36=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +/*
> > + * LED_COMCON force mode bits:
> > + * bit 2   - FORCE_EN (enable force mode for this LED)
> > + * bit 1:0 - FORCE_MODE (00 =3D OFF, 01 =3D ON, 10/11 =3D blink mode1/=
mode2)
> > + *
> > + * Only ON/OFF is supported.
> > + */
> > +#define DAP8211R_LED_COMCON          0xA00B
> > +#define DAP8211R_LED_FORCE_EN_BIT    BIT(2)
> > +#define DAP8211R_LED_FORCE_ON_BIT    BIT(0)
>
> Given your comment, this last one is not strictly correct.
>
> Otherwise, this looks O.K. Lets see what the LLM says.

Sashiko said only [1]: Sashiko has reviewed this patch and found no issues
For some reason it replied only to me and linux-leds.

I'll fix the comment and make v3.

Thank you.
--
Best Regards,
artem

 [1] https://sashiko.dev/#/patchset/20261117114432.2794961-1-a.shimko.dev@g=
mail.com?part=3D4
