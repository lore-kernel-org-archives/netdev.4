Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794948008;
	b=vl8eYFm/ZAZMT5ersH3/Af86lhS/dK4jMl6A2/fyV6s1SvGlzFiNQ3FQRUiCgTxNn/f/
	 AMmVXxnoR3WBChzRrg77Lx1kxRGBjEhfXPH/O8TJoq6JzzUNH2vFa/T3hFaIzIlczEAYH
	 g0hCO3VKNsz2LUOQa5VIDZlf/SFIpxvL/ljXQwCFnY/yQiNtmrhBNAqYbCcK126xHKkIl
	 X07xTFGE3ZSWv9INZ+tzIvPvYOxUw5JW2STg0XTvMAtqsbuoJroNudJU7/O6i8B7dzwcB
	 3r/hXr7a6khSQU4SSOXIKUhyCgvykWKTOTTu2LU96E6Hn9jVadq2XuoBvoNtV14PvWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794948008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:From:To:Cc:
	 Subject:X-Mailer:References:In-Reply-To;
	bh=+zkjXBeMkEDc7QufXqaSGB6NEDq0WBn2vnhWa4XM0nU=;
	b=p3zb6R+m3/pvJP/Zig2aGPWctt3iQbGPpO2nxMlxtrS8Rc7RMX8XtizfgBkAroyDvoEY
	 QNGACMRxWxy/sIqYPd+11soTLJBnjHETdKdFTkbFPmDlRt85etNarE26q+sNCjqDkUHZB
	 rwQSs4/5x0s93T5LJF+nIOOA+Xxxx/8sU2b8PiBBvpnI/DpA8QJX9BM5Ht7He3hejvdQe
	 j/pJn0iifQRvddb9vqIPnMqB0ZOyC773fIt/CrzuTaCjoDDBWHeB+gfD8pLigt+Ym0QUa
	 q091NJE0n2KYLfapbxaXFyKXt9/NHx87iIptCzMbNzCFKYEWCuEy9cquJd67aH+Desw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wQiTHEmc;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB9D606A32C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 20:40:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AB9D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wQiTHEmc
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-92106d5371dso1474656d6.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 12:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794948007; x=1795552807; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+zkjXBeMkEDc7QufXqaSGB6NEDq0WBn2vnhWa4XM0nU=;
        b=wQiTHEmcLJ1w5dl8W2ZrpxnxgBRRFkilfGpWObOByVV4ZYPw/L+jCRd1Scet6nixi/
         YeuzcfJncBd63FE+zpAuuNmoyZKqAb65YnbzZMsWF/qZ4QNZvRpkwhDzXo8Tx0BaUefL
         e7fKeoW+QD8YekVedo20sv8Qve0pX2hmS+p9KBznLxnZXk/Oco2p06XjUYBVeTelSg92
         lWIeUbfDatuFMCbU40OQKvqQLmnN47Md6n+LyaRYhZUEYj0JjmKo6o394rvpJ5XUqNmC
         vk5KDIcarGarUX9DogDTjL+kNjq18fEh+H/j16Xtr5IIQKDf1Hnry0JHY5tKID/GOIkW
         xzgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794948007; x=1795552807;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+zkjXBeMkEDc7QufXqaSGB6NEDq0WBn2vnhWa4XM0nU=;
        b=Z9SlEUkyGLx/0EJCV22eXQouortHKQKflRf+XC9H3ZWe8USNZyKHVx7DWQo1N5UNXY
         BkHJYW5jl2qBltm4fzbQ5i6kKbTa7Em9xB1tS1Va7SCbcJ+YskqjDTUDv2ZEdqJbbHtO
         2qdTWUAxK6FWO41zVIrQqS+Tx+qclaEkK92uIiP2Y8xYPHWUlBUev7/YQS9B8qeg0GYw
         oubziXaBNzGiEmHY07F4I9Y/2NmI48Vlzlm/3fM0f/fvKkV/wydRNJptF0M3IqzIIAUQ
         y3j3rE814+4f6b86Tas8uP9gQzkgLyoFbyNuCaRQORn8egmiltKunekV7mBkPAcZfM/3
         X8Eg==
X-Gm-Message-State: APuU4Z9SJYviIcRWuroV/GXFXSEgB1FLummlexaqQexSeGf2o1L6iytn
	ZvBPf9ZiuphwSqYyJyB/dlWJhZgQsN5W4iNLkC0bApweg9brwCy/1hMv
X-Gm-Gg: AZFdTZeR6jRUpFtamwKUO3uDubU95CoDnIYvusYIVIYm3hVKnouzIupg3cL75+I7hMC
	4/eEDyqs936sy9n1duPYZWtJydVbocgD/LtwWuPnu5IAohjq+rsVpsyJODa+6z2U1AUpNQEPmCc
	gzMe6Kt9P+Osg66A9tdMP+Q480JDYOFRXoNE7abX1Rcb/4zmJfGDuselJx3STo9o7TJoMr4zq5z
	nm0XzhDfKoN+UHNkApObAbXdPd+VY7yNtMQmIqCgTcLp3tuOCwKuv0mVd5GpkFXyKiLP2ryQoAj
	/3Vqi2zX6QKp/8v+OVOkZX3SwfGQQkJ6vDzdKYMZ8SJKGyh1MlTE480BMeutEkSdZeb9gOqI2kD
	vfXIFCyxK7QjBoahtCu+YRiD2B4rnbqTlGxX+gpu1lB3lGQ8UCyw9hMzYACuHhl6546duxRfF++
	K+Js/hd9pgwYpAVewwqbp8pPbR9fq8h5YlEZAYMRoe7rH77y3rqGYQWoACwFEu9fqvXqoEqXbQW
	oKf8RyQ4xuprJj92jSS0gbI2sgCc9v4exRdwx78ue7Qs3ml1iCiV0d1CIbVocaxauXv1kEiP6w2
	8KD2ne0sJG3R94Hm6dc4y3VY0bv2r95zPg==
X-Received: by 2002:a05:6214:449e:b0:917:8c2d:4283 with SMTP id 6a1803df08f44-920fd36e10bmr57938796d6.22.1794948007115;
        Tue, 17 Nov 2026 12:40:07 -0800 (PST)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114db5db5sm2876646d6.43.2026.11.17.12.40.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 12:40:06 -0800 (PST)
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
Date: Tue, 17 Nov 2026 15:40:02 -0500
Message-Id: <DMXRYOOJPIXS.1DIGZP64RMRLW@gmail.com>
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
Subject: Re: [PATCH iwl-next 07/15] idpf: psp: add support for fips
 compliance status
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261117145522.1910636-1-stani@google.com>
 <20261117145522.1910636-8-stani@google.com>
In-Reply-To: <20261117145522.1910636-8-stani@google.com>

On Tue Nov 17, 2026 at 9:55 AM EST, Stan Iliev wrote:
> Add support for querying the FIPS compliance status of the crypto
> offload:
> - Introduce VIRTCHNL2_OP_GET_FIPS_COMPLIANCE_STATUS (567) and
>   struct virtchnl2_get_fips_compliance_status_resp.
> - Implement idpf_send_get_fips_compliance_status(), called from
>   idpf_psp_init(), which logs the status as
>   "compliant@cmvp_cert_<a>_and_<b>" or "noncompliant". The status is
>   informational only: failing to read it doesn't disable PSP.
>
> Signed-off-by: Stan Iliev <stani@google.com>
> ---

[...]

> +
> +/**
> + * idpf_send_get_fips_compliance_status - Get the FIPS compliance status
> + * @adapter: Driver specific private structure
> + *
> + * Query the FIPS compliance status of the crypto offload with
> + * VIRTCHNL2_OP_GET_FIPS_COMPLIANCE_STATUS and log it in the legacy
> + * "compliant@cmvp_cert_<a>_and_<b>" form, or as "noncompliant".
> + *
> + * Return: 0 on success, negative on failure.
> + */
> +int idpf_send_get_fips_compliance_status(struct idpf_adapter *adapter)
> +{
> +	struct libie_ctlq_xn_send_params xn_params =3D {
> +		.chnl_opcode	=3D VIRTCHNL2_OP_GET_FIPS_COMPLIANCE_STATUS,
> +		.timeout_ms	=3D IDPF_VC_XN_DEFAULT_TIMEOUT_MSEC,
> +	};
> +	const struct virtchnl2_get_fips_compliance_status_resp *resp;
> +	struct device *dev =3D &adapter->pdev->dev;
> +	char status[128];
> +	size_t reply_sz;
> +	u32 num_certs;
> +	int len, err;
> +	/* The request has no payload, but libie can't send empty messages */
> +	u8 dummy =3D 0;
> +	u32 i;
> +
> +	err =3D idpf_send_mb_msg(adapter, &xn_params, &dummy, sizeof(dummy));
> +	if (err)
> +		return err;
> +
> +	reply_sz =3D xn_params.recv_mem.iov_len;
> +	resp =3D xn_params.recv_mem.iov_base;
> +	if (reply_sz < sizeof(*resp)) {
> +		err =3D -EIO;
> +		goto release_rx;
> +	}
> +
> +	num_certs =3D le32_to_cpu(resp->num_certs);
> +	if (struct_size(resp, certs, num_certs) > reply_sz) {
> +		err =3D -EIO;
> +		goto release_rx;
> +	}
> +
> +	if (!num_certs) {
> +		dev_info(dev, "PSP FIPS compliance: noncompliant\n");
> +		goto release_rx;
> +	}
> +
> +	len =3D scnprintf(status, sizeof(status), "compliant@cmvp_cert_");
> +	for (i =3D 0; i < num_certs; i++)
> +		len +=3D scnprintf(status + len, sizeof(status) - len, "%s%u",
> +				 i ? "_and_" : "", le32_to_cpu(resp->certs[i]));
> +	dev_info(dev, "PSP FIPS compliance: %s\n", status);
> +

You should think about exposing this with a netlink uapi instead of
making userspace parse it from dmesg. Maybe PSP dev-get.

I would also suggest moving this to a series after the PSP
implementation. It doesn't make sense to have the PSP driver API
implemented over the span of two separate series when stuff like this is
in between.

> +release_rx:
> +	libie_ctlq_release_rx_buf(&xn_params.recv_mem);
> +	return err;
> +}
