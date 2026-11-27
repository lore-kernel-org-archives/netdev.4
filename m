Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769889;
	b=qlG6f7ipo4Ecb15lOZlcM8GEWHdCXfcEbeOU5S2lzNz2eqxeRvBzxJtUs5JVZyPB4YE4
	 WjCUBrFMBJPAsAuWUdnOqg6zr6iucJhWsSE1B8xFKybb82b1ZY6S7/sLQA7Gv/599sFuz
	 ZDfJuTLt+/y6wud1/yYC0649u/AfDOKrJPMpn+KCgAIYMjNfmjMzolW+y8i++W3/+StLH
	 TLzgDLkDiNMOnWylObig8qWxB6ct5HkAg66HpafrhXRLfMiv2Yt+Q+ZYpuywX75xWFnAn
	 OS0QejOWh3GvEco+7O1DdjHg42Bw7ulXaCRkZZgFNnM/nGaZjesfLE2YQB9JaEaIylg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769889;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=gqtKqYuhEKkVXP5KuUjOf9oJJFaxsoPI83OvUiPpv98=;
	b=Sa/f7f8UgL6zSGMdgusLdmwPxXD5a6d/MkcI/hG4GpvEM2kRr1BzCKbomv50nqQhcdPf
	 WHyzRxG/6YT01/Cp+NwpM0EOZhFV06RjwiJJvhuFLXENc808rU3XQCDuOuoEdbJOlt/Tx
	 XSoeYPohFNSbBMXbd5N7BJKjchvsLfwQgX5WGYoKhOwkjm1CBfCRxyOk/99ozDMlvjHVr
	 IAaRus3GLtkXhX+7YuGKpY7hlqeSJwrY35wkx12bptvMMAX6bpE2ncarFpI9zBxoDzErV
	 6JT8AJKz1UCW0doLfH0qpdUuY7tKomnw80Q0CnumMN7k5MMNlWWftAe8MC1c9Mr3tEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=id1tQkOm;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="Z0zmo/Oo";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39655606A329
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 08:58:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39655606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=id1tQkOm;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Z0zmo/Oo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795769888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gqtKqYuhEKkVXP5KuUjOf9oJJFaxsoPI83OvUiPpv98=;
	b=id1tQkOmS9IYdwhsbkjThmM6c7LoJd/MT/cKBKixh+SBb3ssiMsI7XZKS5PUlZ6RmDcCkT
	cjBU6VAtx6twZNJlI+/Ygzi66+WxaWeIv4tcs2ftWGfjInJl8Hav+4WZ2VBF0sZ74q68y6
	IZOZnY7IRes82flFlOB+E5b0nfUl4HI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-aq_FTKezOjuZ9x3f_q9YUw-1; Fri, 27 Nov 2026 08:58:06 +0000
X-MC-Unique: aq_FTKezOjuZ9x3f_q9YUw-1
X-Mimecast-MFC-AGG-ID: aq_FTKezOjuZ9x3f_q9YUw_1795769885
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e1d839ddaso4380270f8f.3
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 00:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795769885; x=1796374685; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gqtKqYuhEKkVXP5KuUjOf9oJJFaxsoPI83OvUiPpv98=;
        b=Z0zmo/OoLAB7+wLuLfw59wbGqclB3cZBjktiiv+AImnEftSTS//Mk5OynPZ6lHx0Hf
         lvh2lMM9PiOLSR4FrchS7V/qeuxtjO+AbzKneCu0sEPSAFwjE5zh8b4KvSJDUxFpEoe8
         acZw2kJS7MCget3RniUg6dUYchLHcRB2zV+d4Gt2paJrgBs16sS4guDKXO6kLvPzW3Tl
         WGaDyjGbdsm9TZHRJ6PBJ7GLm7zm0mWWWzNkZgSqJGx1Co/7tZSdks23DAADz8OJhIHH
         Sf7Ycgc5cwL9yex0Kpeq1pimhRiYiIPuxYuut5G1y5MlZY2fHKcXN9GerYKXyM0Jbg78
         vM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769885; x=1796374685;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gqtKqYuhEKkVXP5KuUjOf9oJJFaxsoPI83OvUiPpv98=;
        b=v+oOV48AsODC3iSl7bZVZXSTHlKHwfK+qkRTNES9RWFUouGrobNpRqr7tnKsSniMfz
         449gqbyqUuNU1N/0sQYkP+paRXhbEpYXJs64VtXhw/1ngzGnfG5C8FUtkDvZLrNZStUp
         EpKtA0bNHu2lc7UmbOJhx8Ojiu4EP4VWIHezBH2exIlhczgYNLlhe87b9JDrey5p8GuT
         8NMJPoA3Gw73X9r99DLIhHvrbqhy3ByZNuaCz42Aplzs37tp5EO0ELCnAYPCP22q/qC3
         0yis7O0PuEcg8/+XChb0FVHZ377KftUkmRSICIUdWjsAd5H7lBcpBpzR7yBb3mj/VL72
         AgLw==
X-Forwarded-Encrypted: i=1; AL+hErHWqx73xE4MOKJBDk8CXchh8dLu4OxZpBiGlE6L7KY3pALqBXYqiFlN4Jbw/mVeSElnm1XzWms=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ogzKpNwsRdPO0H1906R0hdrW1ZnFhQsRoVSwbXSAtX68JhuRr
	OehXvpf8Q2ms+vQ+8xnXQEeW6NjsEN4RZeeUPrKYswJHBVhansN7hGFzqvANPlrHXgLalrB5wtF
	ZeO0uTZi4De9BqjXUg3oUspRdeaNGvOEg4/207aEBUfoffCVwFyKUygDkLA==
X-Gm-Gg: AZFdTZcQIRupsIXSJHheQrqrRuYs9Z4QrPdn7ruJGTML00A0+FTxAWCi7AaWE2j0UpF
	NaMyEMlpcjQemQ5lVRNxhugyhHNbvyUJw8rFu65CuO1x2DZDspDbF5xG1I762BKy0eiN2UgsfQN
	qmVT0jDsZLbb56ypEFSM/KZrHI4lMdSHDGIBJfw270z4H6azosUd15SudYkV+FvME7qB3hLuz0o
	Ar5eQk/4Xtosw4i9cSTQcoWplzt+pFXimQXFRFq7PPlHpv327NtfV2dh0TyHJR1335rhvCTW4/t
	s82tVdMNm46+0cZegU2K1r8zsUFgQ6FnOICGRCR7Ukakmvm8POLlNXX/6p0GOdkjF2t+H1wrVi9
	AHmP0JbM9oQIKqfRHln3mexa058WdEjtUzdOulezqHCdDlCath5yaOmtlU1XRBx7fHUAuh6toxL
	ZHLYGZgSGsFg7qSxKZyoIOsntdDRI/SXU8OPUnUXXW1anB
X-Received: by 2002:a05:6000:4a10:b0:48c:7306:18e9 with SMTP id ffacd0b85a97d-4abb47b1bb6mr45714807f8f.43.1795769884959;
        Fri, 27 Nov 2026 00:58:04 -0800 (PST)
X-Received: by 2002:a05:6000:4a10:b0:48c:7306:18e9 with SMTP id ffacd0b85a97d-4abb47b1bb6mr45714754f8f.43.1795769884536;
        Fri, 27 Nov 2026 00:58:04 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61e8sm47550239f8f.11.2026.11.27.00.58.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 00:58:04 -0800 (PST)
Message-ID: <1536daff-bfb1-47fa-9f77-cefc1c32df37@redhat.com>
Date: Fri, 27 Nov 2026 09:58:02 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next V3 1/5] net/mlx5: nodnic: Introduce the
 mlx5_nodnic driver
To: Tariq Toukan <tariqt@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: Carolina Jubran <cjubran@nvidia.com>, Gal Pressman <gal@nvidia.com>,
 open list <linux-kernel@vger.kernel.org>,
 Shahar Shitrit <shshitrit@nvidia.com>, Simon Horman <horms@kernel.org>
References: <20261126182448.707782-1-tariqt@nvidia.com>
 <20261126182448.707782-2-tariqt@nvidia.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261126182448.707782-2-tariqt@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/26 19:24, Tariq Toukan wrote:
> +struct mlx5_ifc_nodnic_clear_int_bits {
> +	u8 reserved_at_0[0x1f];
> +	u8 clear_int[0x1];

For some reason coccinelle is not happy here:

+/srv/nipa-builds-contest/testing/wt-cocci/drivers/net/ethernet/mellanox/mlx5/nodnic/nodnic_ifc.h:140:4-13: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

[...]> +struct mlx5_ifc_nodnic_gen_cfg_caps_bits  {
> +	u8 revision[0x8];
> +	u8 hardware_format[0x8];
> +	u8 support_receive_filter[0x1];
> +	u8 support_promisc_filter[0x1];
> +	u8 support_promisc_multicast[0x1];
> +	u8 support_protocol_filter[0x1];
> +	u8 reserved_at_13[0x1];
> +	u8 log_working_buffer_size[0x3];
> +	u8 log_pkey_table_size[0x4]; /* IB */
> +	u8 reserved_at_1a[0x3];
> +	u8 num_ports[0x1];

and here:

+/srv/nipa-builds-contest/testing/wt-cocci/drivers/net/ethernet/mellanox/mlx5/nodnic/nodnic_ifc.h:271:4-13: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Both look like false positive, but could you please have a look?

I removing the series from PW, we want clean CI output, otherwise
patch validation becomes more expensive.

Thanks,

Paolo

