Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936866;
	b=goMOHFn+c417SnAtpYaTJVJMlfdpqjrZ3J+Mkvjw9QQ/FyC7r2R3EuOgPPth+V4IeJT/
	 71/MU1WoxA+O+KY7BncKHhyuE7j3m5rRva/klUXbPfEkLlRtu8CFfHQWiYnoKBKkiS4Vf
	 gmOpBXuFOYNe6vetkgCQMb53Oyl9Vo0rfLwVBRKrvxDn+z+YFg9tINzPy2rzm7R12a56W
	 T4frrLHx2IrJiX9FYRteeyZeKmM/rGg3/fJCu0KHSahHR0mwn7AwwWZ9PSWoUy1ionOfQ
	 t5OAyM5m8zoNVlw8HWdyfIwh5T0x2Fz0bx0Mz86HbU6uG2ijDzKPl6ioUgBWNloMqHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:From:To:Cc:
	 Subject:X-Mailer:References:In-Reply-To;
	bh=pVxrfzsOkS8R/UI8C/+4VKwcJVz62eWVYB27WSqCUBg=;
	b=5CwOsclAspVlV547/cs4IkT/VJN311KydHOS1ZZ4X3wkY6n6FLUhKbbvlibd4Dq5LVtj
	 23fVk2ls1EbgQKBHi8ST9FJl6yKT4FVKi0wAW95+M33Jy67qKnD20D3kSKFGT3CAram1J
	 zHG31tzyOf5V+gCJyW0ZPVr/DVJAYEJjWIxVJsUwDPClmAl++q7j5Wfcxdu+02enjDz3F
	 sgJnYQOvsRczCuEM0X59iyF6wdwiBNh2BGlWrh1f9CZAB6aDGrfWdn2LIPXdveYT3qUDo
	 CTpSIO5j3tbirzVfRkCOZOpuDNpr3AgTwhKjnlztX/OYUcCvc/Y74QzLTI+wgI51PkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qr7XUmH6;
	arc=none smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E132B606A32F
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 17:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E132B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qr7XUmH6
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93f3c616c84so8639185a.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 09:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936865; x=1795541665; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pVxrfzsOkS8R/UI8C/+4VKwcJVz62eWVYB27WSqCUBg=;
        b=Qr7XUmH6x8Z/p+YdIWnygkcR2vJShVVMJrdU+zOSWrQ5wZaG+5mXDdsYZq65eGEmao
         GbogGEj7gmhDe8I4Z+d96Ba1grCDYluAq46K//hsHcPLjbJFms1SK49YtUu9bYz4ztL1
         2aLBCzCaH+mLAPUwOZo7NeXwmkN5fTptUBwZOC2lidhDC5vNgHQvrE6P0S6BzU59GzYz
         wntVAsKhzTUN1HacDyMFsTDKVnj2KPZ089oSwjY6RjBC41n3xl+mG73QzADcyWYpaOql
         Bh8BciCQXirQzs2Vb8oXVdH5maxlxBPZ1W0p1mDAw1xcQHt3FtrEDW0xM4raCPKzaTcj
         Z06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936865; x=1795541665;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVxrfzsOkS8R/UI8C/+4VKwcJVz62eWVYB27WSqCUBg=;
        b=wWllVrf4311aaCm8Ul6rBifUXFqVmnf0bWooOq0xZm7+c8dJ5vbXIva+9vv+g7bxX2
         Xsrgmaq/uLHjAR7XuB7yodTmAV3zlXy09/xf5k+vuCLV1ZI1nHXojERgNS9OSeogH+fN
         krAvPTl+oPvrLCETEuB4IuF3r3SatRqLHMi2clZ0NKCjOhcHUXQc2KMjBrOddStob4rJ
         SeMa4Eb2ZDH2xTK0b6iTLrDggnDpvk0rIsDd4dcpnu+7zS1wIS4ynclJTHYJX28rqxA/
         TI+7FkueAVcRtq7mtHnhv60sJlDhE+G0G+VMDxsfZA2deo3AOBok26C3ruZgutLc7cWp
         WFBw==
X-Gm-Message-State: APuU4Z9k0p1FV4YGn+7xz1VloxHg1VvOsw09ElvO2Uu7pv8lG+4Ngyfv
	Ei4fCBnBnfPLvbMmjjzlRnT90JUMOCjUFTUuinhE3QSIlepKEgy/KnIW
X-Gm-Gg: AYBFou19ez0UUmsRl+2ZvIQXm2MDU33mhPuYK9b7e0caohWocjEwnPH8ndn74L/vtaN
	o1G9lqO9pALAh5fAu+LulJeanczQpv841s9g3c6kzbFjLT6+clCR+lNvqvwf8NR9pSWI07qYC+L
	3/xA++PNgVRVLfK7u0ehROl0+s/2OORz7xIyQnJIuENuOZVe/pbuk50Zt7QjfZ5MeRAElRC9xR4
	HTgs62CAO0Ms6Gqi4cjYIpMNrRkfbhVvaEcTUuFBRsdaSWq3CZyoiroUreXmYKiIzVTSuiLberz
	f21+abXUzjvu0oCKl8YrCvt7CAy6H1jSi+dyHpYA9nKY3ItUr5dGbVOtHdJyx4wkeaCHFjFIgAc
	zjg48ud9tnXTkCQsEgBfDESKmogbX7csMLZX84FZdDLgiJnbZk/g3wBTUtwYiSAwZC9rKOEQ+ss
	+MxaL4n0pXSI7N51ycUo47BKF5SAC4/xDTeGLhWpKi6NAt995y51EXqreFIj9y2kBclKfF/phGr
	F1Dxy7cfDABgGHNy487P/YOH61u0sUPALOifVS0Y2s8+5wBzSq/scz2efcQioMvZmNJJg9D2gPW
	Ii/Hr562O1NqBnlqfQ==
X-Received: by 2002:a05:620a:1714:b0:949:73f3:83c with SMTP id af79cd13be357-94999572b95mr73032085a.21.1794936864878;
        Tue, 17 Nov 2026 09:34:24 -0800 (PST)
Received: from localhost ([2620:10d:c091:500::7:5db8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c831b7dsm1139318185a.20.2026.11.17.09.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 09:34:24 -0800 (PST)
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
Date: Tue, 17 Nov 2026 12:34:23 -0500
Message-Id: <DMXO0JIUCNYA.1940X1XHRX6SF@gmail.com>
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Stan Iliev" <stani@google.com>, "Tony Nguyen"
 <anthony.l.nguyen@intel.com>, "Przemek Kitszel"
 <przemyslaw.kitszel@intel.com>, "David S. Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>,
 <intel-wired-lan@lists.osuosl.org>
Cc: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "David
 Decotigny" <decot@google.com>, "Madhu Chittim" <madhu.chittim@intel.com>,
 "Emil Tantilov" <emil.s.tantilov@intel.com>, "Sridhar Samudrala"
 <sridhar.samudrala@intel.com>, "Brian Vazquez" <brianvv@google.com>, "Li
 Li" <boolli@google.com>, "Alexander Lobakin"
 <aleksander.lobakin@intel.com>, "Daniel Zahka" <daniel.zahka@gmail.com>,
 "Willem de Bruijn" <willemdebruijn.kernel@gmail.com>, "Kees Cook"
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH iwl-next 04/15] idpf: psp: add psp offload
 initialization
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261117145522.1910636-1-stani@google.com>
 <20261117145522.1910636-5-stani@google.com>
In-Reply-To: <20261117145522.1910636-5-stani@google.com>

On Tue Nov 17, 2026 at 9:55 AM EST, Stan Iliev wrote:
> Add the PSP offload initialization:
> - Introduce VIRTCHNL2_CAP_CRYPTO (bit 26 of the other capabilities)
>   and request it in VIRTCHNL2_OP_GET_CAPS if CONFIG_INET_PSP is
>   enabled.
> - Add struct idpf_adapter_psp to struct idpf_adapter.
> - Implement idpf_psp_init(), called from idpf_vc_core_init() on each
>   core init, including after a hard reset, and idpf_psp_free(), called
>   from idpf_remove(). PSP is enabled if VIRTCHNL2_CAP_CRYPTO was
>   granted, see idpf_is_psp_ena(). A failure disables PSP instead of
>   failing the core init.
> - Add the PSP device ops with idpf_psp_set_config(), and
>   idpf_psp_register()/idpf_psp_unregister(). The PSP device is
>   registered in a later patch, once all mandatory PSP device ops and the
>   datapath are implemented.
> - Build idpf_psp.c only with CONFIG_INET_PSP, with static inline stubs
>   in idpf_psp.h otherwise.
>
> Signed-off-by: Stan Iliev <stani@google.com>
> ---
> +
> +/**
> + * idpf_psp_set_config - Set the PSP device configuration
> + * @psd: PSP device
> + * @conf: new configuration
> + * @extack: netlink extended ack for error reporting
> + *
> + * The configuration is applied by the PSP core.
> + *
> + * Return: 0.
> + */
> +static int idpf_psp_set_config(struct psp_dev *psd, struct psp_dev_confi=
g *conf,
> +			       struct netlink_ext_ack *extack)
> +{
> +	return 0;

this is supposed to enable/disable PSP Rx on the device. It should
probably either do something or have a TODO or comment explaining that
the HW doesn't support disabling parsing packets as PSP.
