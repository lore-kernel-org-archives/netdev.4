Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794953710;
	b=jPm0wtp2CuhaApNr0uXctdXlGK1ApC8xo70sM37DB9yc/weEUX0ocJbk1t5bPXqAX5xo
	 6+J7h2TUokXI7F1NIQXRuYCPhaXKwyn7naGQgxJ8Si2JiFBApwArImGgNUE1EusuPRvYh
	 i4qJRmyuuktmBSbuLCoisZbZsHcFMDYKVJpSzboGEi/2YZZ52jhCqvMcpojZQ6I8hisy3
	 sO2TEY8nde6j1Ly3YEwWZVQxX+2jTk/jBYpitkQL2gN5g0cFoFUDiTBjUU1VwqTOSaTv9
	 Y4mbn955cuHppt7DJF5iyjpCSpm3jZqs9eJiwyOrEn/REe6VAb+L0t5jd5z66Wc+5vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953710;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To;
	bh=8igbL3DrmgjB8f+3uFsYWHUjBeZpK0nAdLK0B3NxyZE=;
	b=3uo5JHtWMiDYA9yRigJOmAyFZ80TN5upqyK1AIAimkoyp+fYBkMINdKtJhbaSKLxMwNo
	 GT8YzCTuVavCRdSclYZ4yJSSrIx9ThmDGj++qM0iGRQDouhmtkCboTIzlyxXJlGoqb/ig
	 xTwDVHcSTvElyY7ZD2R/wH0aRe9MENIg/CeKIhO2dZs4/0x29JpQgAc+BDGfzOk2LNRVL
	 ycrPhktzy5SxBnufGTE0iTCaVywngwQ3COCIuPuzjbYKQXYI8crVK7gPBd3Vf/L9A/5uc
	 6wQyslMhVmnu+NlZUbGIEzQ0YO9xOFiDMP9H8ITz2/6O15lho33qWxDeN4WSO051TtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Omz6m5sE;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DDD606A32C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 22:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68DDD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Omz6m5sE
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91f2b826fe9so1968476d6.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 14:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794953709; x=1795558509; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8igbL3DrmgjB8f+3uFsYWHUjBeZpK0nAdLK0B3NxyZE=;
        b=Omz6m5sEdcCo6i+rZhY1yYYjJkJ14J3/ehViGl2tfjKF8iKEXM6zW6OcK01d0pvglQ
         /FyWYDd3s9dTK874m371PT9CPkHc8iiyhftD6T3ezaFb/DKKKdfmKq8+1bbBRWF2f59r
         pPx0POo1MPsFAIzd4H2wfPc3JPhFi1cneOymArj+Nb7qd6SedaCUb+I0aF3LIjuWBWiC
         0hhANseDZJJQl3514kujAp1eUbsyHKXvuoKsCflx/Akjgi0B/tlwc5X5HqqoixQSbJQe
         qatcOfCVlvQrT6KKtTYaiM1cyk0aObDlkWtUfL4ACKut8n/uzQdXMiEHSkUPiEYiqVTv
         sYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953709; x=1795558509;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8igbL3DrmgjB8f+3uFsYWHUjBeZpK0nAdLK0B3NxyZE=;
        b=PMG9PpP2zHAPSInwW+aueo2yVnl93oqDeGJFGopPRszx7sv809slgnErK8sf0DyHcf
         a6GL35/vJa3kwfw943OfYhzSsQVLf7S3UOIXfM8Ok/lEg5AreS0ISSEhNz1Y+dtUmhhc
         y2wzVRrVOKKIEDpRSmM15LF7xgEzXr2wzln80i2D08PwCEsNbxYKpmtMboEWtJTqtYxZ
         D4/oet7Nvi1Jhk5Ng0lPPKBhuYAwvJRxd64vbhWQPFLy0/8hQFUd6WjjwSrrU674dXsC
         86OS3AhEXNqgNTYr6Nv/q5Ugv1m97weRZJdnPFI5QAB828uonJ4jU/jFfT/z0aDX4yTn
         XO/w==
X-Gm-Message-State: APuU4Z84JKFIljmpxl0+Xiw3AkUR6rvamUok3/FUb3/kVx+VyP2Qq9+z
	wjJhbs6SF2TXMAK6fXkTnRR3W5Cii9HM9tKOGaj+RQ+4PQSAmF+3iha3
X-Gm-Gg: AYBFou3m9MxRZMn3RGslCPu1ukCeZhgeV7z/Q54YHbf9NfDLeVpf9y4vNgsonhM+Msm
	gr1tHdRl9fnAtUD5vO9qWU/CrC9tbJwMOvNBw/pk6J0vMFTDf9LZLE58QuONGKGzwdM2A+GdmIh
	cCwOK76GyvuU+AUq7+k4lph2ETVipwwsG2taCTKSfZgYpbF2YtZT5+MtQ6aQH4T4m0uwQk4XX/S
	0gwDPrn88+MiSg7wYin1QtPJPEVfAiOgRP27qh7j+gIACfZ/FmLdFF1xxTwaWFrjM7+rp9yPC6/
	Id9qzKvzorKsZBbU1ZIWyd8xgWdQDEjEzmZ3GuIkl0UaK3HWPMOBNCxjWMcfFKst+MhbqTL8Jdp
	c9DLTRK5Zrj6bLsGcYpmo7qIlZwZ24o6oU/s95mMShY3Qys8kc+KwVyOl+HD2dTIryQSJHDrGF8
	wPDeCOZE4kC611QTX25jPinbYcJaL39n6lRoQ9LTx+U7artSyn/WyzLca08NxeXaxVdRG3vs20D
	96WjEuT6pvj5Mb8wXwNHvg5WCBquHPcU/zQqxOndJ6Z1uP/QVXv9RypARF7hc3LRJtInyx6+3wx
	yptE1Et7h9iUAMDFQt2mIwTeU2/wU8AqLA==
X-Received: by 2002:a05:622a:307:b0:55d:1db7:3ef4 with SMTP id d75a77b69052e-55d5a5b77b2mr12272421cf.41.1794953708820;
        Tue, 17 Nov 2026 14:15:08 -0800 (PST)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d53b7fsm4789176d6.26.2026.11.17.14.15.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 14:15:08 -0800 (PST)
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
Date: Tue, 17 Nov 2026 17:15:07 -0500
Message-Id: <DMXTZHJA6OGI.3RFGSK5SE9RUF@gmail.com>
Cc: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "David
 Decotigny" <decot@google.com>, "Madhu Chittim" <madhu.chittim@intel.com>,
 "Emil Tantilov" <emil.s.tantilov@intel.com>, "Sridhar Samudrala"
 <sridhar.samudrala@intel.com>, "Brian Vazquez" <brianvv@google.com>, "Li
 Li" <boolli@google.com>, "Alexander Lobakin"
 <aleksander.lobakin@intel.com>, "Daniel Zahka" <daniel.zahka@gmail.com>,
 "Willem de Bruijn" <willemdebruijn.kernel@gmail.com>, "Kees Cook"
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH iwl-next 09/15] idpf: psp: add support for psp key
 rotation
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Stan Iliev" <stani@google.com>, "Tony Nguyen"
 <anthony.l.nguyen@intel.com>, "Przemek Kitszel"
 <przemyslaw.kitszel@intel.com>, "David S. Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>,
 <intel-wired-lan@lists.osuosl.org>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261117145522.1910636-1-stani@google.com>
 <20261117145522.1910636-10-stani@google.com>
In-Reply-To: <20261117145522.1910636-10-stani@google.com>

On Tue Nov 17, 2026 at 9:55 AM EST, Stan Iliev wrote:
> Add support for PSP master key rotation:
> - Introduce VIRTCHNL2_OP_PSP_ROTATE_KEYGEN_REQUEST (563),
>   struct virtchnl2_psp_rotate_keygen_request/_response,
>   VIRTCHNL2_EVENT_PSP_ROTATE_KEY (4) and
>   struct virtchnl2_psp_rotation_event/_data.
> - Implement the key_rotate PSP device op with
>   idpf_psp_rotation_request(), which fails with -EOPNOTSUPP if
>   VIRTCHNL2_CAP_PSP_REQUEST_ROTATION was not granted. The PSP core
>   increments the PSP device generation before calling the op and
>   doesn't restore it if the op fails: the op restores it then.
> - Track the master key of the allocated RX SPIs, to report their
>   generation on receive in a later patch: bit 31 of an SPI selects one
>   of the two master keys of the CP, and the CP master key generation
>   of the allocation tells when a master key was replaced. The packets
>   of a master key get the PSP device generation that was current when
>   its first SPI was allocated, which is the generation of the
>   associations using it. Associations then survive one rotation, as the
>   PSP core expects.
> - Handle VIRTCHNL2_EVENT_PSP_ROTATE_KEY in idpf_recv_event_msg() with
>   idpf_psp_rotation_event(), which logs the new master key generation.
>   The PSP core can't be told about rotations it didn't request, like
>   in mlx5: document the limitation and a possible solution.
>
> Signed-off-by: Stan Iliev <stani@google.com>
> ---

[...]

> +/**
> + * idpf_psp_rx_gen_update - Track the master key of an allocated SPI
> + * @adapter: private data struct
> + * @psd: PSP device, locked
> + * @spi: SPI allocated by the CP
> + * @cp_gen: CP master key generation of @spi
> + *
> + * Bit 31 of an SPI selects one of the two master keys of the CP, a rota=
tion
> + * replaces the older one. The HW doesn't tell which master key decrypte=
d a
> + * packet: report the PSP device generation that was current when the fi=
rst
> + * SPI of the master key was allocated, which is the generation of the
> + * associations using it, see idpf_psp_rx_process_skb(). The CP master k=
ey
> + * generation tells when a master key was replaced, including by a rotat=
ion
> + * the PSP core didn't request, see idpf_psp_rotation_event().
> + */
> +static void idpf_psp_rx_gen_update(struct idpf_adapter *adapter,
> +				   struct psp_dev *psd, __be32 spi, u32 cp_gen)
> +{
> +	struct idpf_psp_rx_gen *rx_gen;
> +
> +	lockdep_assert_held(&psd->lock);
> +
> +	rx_gen =3D &adapter->psp.rx_gen[be32_to_cpu(spi) >> 31];
> +	if (rx_gen->gen !=3D IDPF_PSP_GEN_UNKNOWN && rx_gen->cp_gen =3D=3D cp_g=
en)
> +		return;
> +
> +	rx_gen->cp_gen =3D cp_gen;
> +	WRITE_ONCE(rx_gen->gen, psd->generation);

WRITE_ONCE isn't paired here. I'm guessing the Rx code in series 2 will
copy rx_gen->gen into the psp skb extension, but that would likely not
be correct. The generation field in the extension should be copied from
Rx completion metadata. If such a descriptor field doesn't exist, then
the key_rotate() implementation might as well pin psd->generation =3D 0
like mlx5 does.

> +}
> +
