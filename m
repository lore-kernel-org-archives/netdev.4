Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823072;
	b=Bc/0R6sv0aLuEtSt27VSksXEuiLyCkVPyaL24vVtlVgmBkoDoL9kmKB7aB2WNER9RP3d
	 HlqAy6YzC04QEtE9rHNk5Bj6zxtS71ayhsZcz9/7knvd4f03s6+aPw7GsF41MUNUhCRy4
	 pE9B7wlQTWt0GIDm/n+6Sa00XPWd2TaODD8y6X6ly+tH+q/Zdz2ihfQOJsIazprEkscIL
	 JEnY93aDp8yJyhEMQu6mhMqPJZzQzjJ/MMdzWkFw/odEEzOjY+Vu5KYTzNrbj0s7OAL/8
	 tneOIWtHgCRKXkXaxaMH31S0DR7AaZ+VsD1vKIZUMI1qH8mLWMLgcGXMoqBOXTyosFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=MWv3RsE66Q/ysLjuk87PE8PT3esdU32Mz6gnhtaxttw=;
	b=5jGsgu6c0sqcNyrHWitya5W5PP/R2viVw5wbYu/wjwgYoRggdTWlPL7I4Ub4HiaXC8Vm
	 noswlHzAsMIIY9WiznVoOjiI3Oe3ERxg6sBhvIINYlDz+Mfg6r2axTpw+oKI0agEtByRJ
	 CEUbNEq6Q/YbAxLT4wRAVYa34symn7mT9lkuz8cTDJXmlyZvK26kKCJX3282R7xpj9+ka
	 ITfymKk6k9oDjgEZ0CWJ8Uqb/aQWIPPPsyrUD+PFmYv60sE4l1EYGmyyMHgNH4v8dqvST
	 EBIFhg2NrZHO9+AuTrvynuJlhb0Q4LjfldYGWFeTT+nd+wEgOCvqmj9KpMeI5XZ5Rsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=SSUp2oWT;
	arc=none smtp.remote-ip=74.125.228.134
Received: from mail-ej2-f6.google.com (mail-ej2-f6.google.com [74.125.228.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3C5606A31C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 09:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F3C5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=SSUp2oWT
Received: by mail-ej2-f6.google.com with SMTP id a640c23a62f3a-c50515c3ba6so191040266b.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 01:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794823069; x=1795427869; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MWv3RsE66Q/ysLjuk87PE8PT3esdU32Mz6gnhtaxttw=;
        b=SSUp2oWTZSry057Ydg93HqrTUD99Iiou03eTgBVn7fLueSQ7RevvpaJkCBUofQ4Lmj
         QRuzczAx457CvcqLBKTSKSUXNMydVc81Xu/eIKKDN6Ny9hGh4+szs2lvsuZmNqA20IlG
         iYyP3IxRzh9JI1nDuVvnLAO/FvHFTRwBTyI1n1T5pEzFIsOWYtSMPyWXBaW0hvzUmFEC
         nrCHsOVwLD6YGjs10b7ZM3FhbLGGsYLCmu+JJvM8dDoMNiNWwmy75JSeFpBOob2JwgBa
         jS8XlCbIIFAbSPVzpuZUX69h5W79oSs9gMy5AyTRGj5yneznI5OcfeZRB1UxLJr1BMVg
         dn9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794823069; x=1795427869;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MWv3RsE66Q/ysLjuk87PE8PT3esdU32Mz6gnhtaxttw=;
        b=OpTWJXWGD+9MObYfKYf3Z44fQdvq1I4kp7gxiIpTk5al0bxDlIJSEZ+17FK8Naxzud
         YwwxUWqP0gSphit1VEriLqtpM63UJcQFfOj7fr+uPRPBKlPwV+dH3Or9XE/9f4Yz9jBs
         FasLZYSM70qGjd1PcGhYFK/HrurQr/jssbO10DN9jwqcZ3k8TWf/wj1RwzhZvHJ3CrZO
         UQa0ROzU6YOShNtceaLag9IynHUGaL+HAgIDKg/0cugU0cfkr1B3oyxL16vBTaB0kmhS
         qnQu3nXPn0dWbbvHAGoB+rMW110QEObPu7GqSIxR9HST0jYl3wEW4vzO+1K6ZIPDwI0j
         yTqw==
X-Forwarded-Encrypted: i=1; AL+hErGwMSoiw4gZ7FEDrgZj0b8GdPSZIO7oiJj6jgcB6XG+mtvrH+3j0Nvr3QAG17mCADCmksPowTY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LEG3dOpiDjAakUx6pKekE0ZgWe8k0410oIjp3xVbjFBe52uy3
	md69ctDI6PxOdxtov+uZtUdITRd1G5ciFCMq05kYY5PgigbTltKLmCohqpZhkaR8Ne2iP5iEfiU
	/Li6eLjsilA==
X-Gm-Gg: AYBFou1cVZA7h85KlPsEFfl5PtTDd4kDAk3LUCf7oudCQPdM2eQPBuacgEKJ+Zpafg2
	rBx2rxl72XvCD8Da167CLFrCzO6nm2Rwpu8CT+NnaYkmHBOskv3jptEpC8u41VgUx80DlpBiDkm
	0rbfEM82eHeoRcbKafBZ/du0Q6jEUGGYOJx6vcOzdydbUtE+BGSInnQOtJFgt/tFp8K/2uLvM7B
	IIwaPy6LUSKvploWv4FgSdMIPBveakL2/r3kYkhp8KyejK2jTfgo9cIlpc/hJsREvBEcHHf9AG9
	R/T4HnJ6djkogC94W1PLQHk5tXEDVTBsjxg/XqZLTZmvtm73AiMw+9roPKXx4L6V/dh/4nk9w6M
	pnpLowRkmpLkOVcZascAUfo+Fyl10OmWxNbHVNuJE/J96AxtTbU2hRw8PV2rYV1L/hwWs09l7xC
	lkQwRIF/EFoUevMsx8RTWT7yylOIFFBXGWY/GKS+K92sNxCJ61T5crOpazSL0EQqBANMeaHMgQH
	XxOwE1mUIs+KxOseu3cF7j5o7XdUJ94OLx3uOjcU2uQGmSbsokdjtVvklEL3VrBeh8vB2Lrmd3W
	ZXIsEPUo/G9WZWW/DX24Yzr9G6qRYCkv9Lh2uJ3u18yi/lvbKMVc/7KFWdg=
X-Received: by 2002:a17:907:2d0b:b0:c24:4128:c19f with SMTP id a640c23a62f3a-c5096327391mr838159866b.11.1794823069529;
        Mon, 16 Nov 2026 01:57:49 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5a78csm392751766b.4.2026.11.16.01.57.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 01:57:49 -0800 (PST)
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
Date: Mon, 16 Nov 2026 10:57:48 +0100
Message-Id: <DMWJOF3M99U0.3G5IY77AS4CWQ@fairphone.com>
Cc: <linux-kernel@vger.kernel.org>, "Robert Dolca" <robert.dolca@intel.com>,
 <netdev@vger.kernel.org>, <oe-linux-nfc@lists.linux.dev>, "Samuel Ortiz"
 <sameo@linux.intel.com>, "Kang Chen" <void0red@gmail.com>
Subject: Re: [PATCH] nfc: fdp: reject an oversized device-reported packet
 length
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: <hexlabsecurity@proton.me>, "David Heidelberg" <david@ixit.cz>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20260615-b4-disp-f42dce2d-v1-1-186ff3dcbf37@proton.me>
In-Reply-To: <20260615-b4-disp-f42dce2d-v1-1-186ff3dcbf37@proton.me>

On Mon Jun 15, 2026 at 10:04 AM CEST, Bryam Vargas via B4 Relay wrote:
> From: Bryam Vargas <hexlabsecurity@proton.me>
>
> fdp_nci_i2c_read() reads the length of the next packet from the device
> into phy->next_read_size and uses it as the i2c_master_recv() byte count
> into a fixed on-stack buffer:
>
> 	u8 tmp[FDP_NCI_I2C_MAX_PAYLOAD];		/* 261 bytes */
> 	...
> 	len =3D phy->next_read_size;
> 	r =3D i2c_master_recv(client, tmp, len);
>
> When a "length packet" arrives (tmp[0] =3D=3D 0 && tmp[1] =3D=3D 0), the =
next
> length is taken verbatim from two device-supplied bytes:
>
> 	phy->next_read_size =3D (tmp[2] << 8) + tmp[3] + 3;
>
> next_read_size is a u16, so this can be driven as high as 65535 - far
> larger than the 261-byte tmp[] buffer - and it is never bounded before
> the next iteration's i2c_master_recv(). A malfunctioning, malicious or
> counterfeit FDP NFC controller (or an attacker tampering with the I2C
> bus) that sends such a length packet makes i2c_master_recv() write up to
> about 64 KB into the 261-byte on-stack buffer: a stack out-of-bounds
> write that clobbers the stack canary, saved registers and the return
> address.
>
> Reject a next_read_size larger than the receive buffer the same way a
> corrupted packet is already handled - drop it and force resynchronization
> - so a device can never drive an over-length read.
>
> Fixes: a06347c04c13 ("NFC: Add Intel Fields Peak NFC solution driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryam Vargas <hexlabsecurity@proton.me>
> ---
> I reproduced the out-of-bounds write with an in-kernel test that drives
> the fdp_nci_i2c_read() buffer geometry verbatim under KASAN
> (CONFIG_KASAN_STACK=3Dy), modelling i2c_master_recv() delivering
> next_read_size device bytes into the 261-byte tmp[] buffer:
>
>   next_read_size =3D 281, no bound:
>     BUG: KASAN: stack-out-of-bounds in i2c_master_recv...
>     Write of size 281 ... [48, 309) 'tmp'   (the 261-byte buffer)
>   with the device length bounded to <=3D FDP_NCI_I2C_MAX_PAYLOAD (what th=
is
>     patch enforces): no KASAN report.
>   a well-formed packet (length <=3D 261) is unaffected, no KASAN report.
>
> The full device range - next_read_size =3D 65535 (tmp[2] =3D 0xff,
> tmp[3] =3D 0xfc; the u16 field truncates the + 3), a 65535-byte write =3D
> 65274 bytes past the buffer, smashing the stack canary and the return
> address - reproduces the same way under userspace AddressSanitizer on
> both -m32 and -m64.
> ---
>  drivers/nfc/fdp/i2c.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/nfc/fdp/i2c.c b/drivers/nfc/fdp/i2c.c
> index c1896a1d978c..0392bb49bb4b 100644
> --- a/drivers/nfc/fdp/i2c.c
> +++ b/drivers/nfc/fdp/i2c.c
> @@ -166,6 +166,20 @@ static int fdp_nci_i2c_read(struct fdp_i2c_phy *phy,=
 struct sk_buff **skb)
>  		/* Packet that contains a length */
>  		if (tmp[0] =3D=3D 0 && tmp[1] =3D=3D 0) {
>  			phy->next_read_size =3D (tmp[2] << 8) + tmp[3] + 3;
> +
> +			/*
> +			 * next_read_size is taken from the device and is used
> +			 * as the i2c_master_recv() count on the next iteration.
> +			 * A value larger than the receive buffer would overflow
> +			 * tmp[]; treat it like a corrupted packet and force
> +			 * resynchronization.
> +			 */
> +			if (phy->next_read_size > FDP_NCI_I2C_MAX_PAYLOAD) {
> +				dev_dbg(&client->dev, "%s: corrupted packet\n",
> +					__func__);
> +				phy->next_read_size =3D FDP_NCI_I2C_MIN_PAYLOAD;
> +				goto flush;
> +			}

Hi Bryam,

Just sharing because I find it curious, this issue has already been
addressed 9 years ago (August 2017) in Google's Android kernel:
https://android-review.googlesource.com/c/kernel/common/+/461836

Would've been nice if they would have shared it back then...

Regards
Luca

>  		} else {
>  			phy->next_read_size =3D FDP_NCI_I2C_MIN_PAYLOAD;
> =20
>
> ---
> base-commit: 8e65320d91cdc3b241d4b94855c88459b91abf66
> change-id: 20260615-b4-disp-f42dce2d-055035ea37ba
>
> Best regards,


