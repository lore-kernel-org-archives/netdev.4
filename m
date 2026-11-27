Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770409;
	b=dU+LgITIIOMfA2T1pE7fV7OS2Z4/YkgFtt2wWS9vjqwgO7eJ9yt7GiRDb4Ij7/2Aapo0
	 lYR4hBS3AgO5E+r/nnkuJWtHqBT8piN3aU+vl4i1lwp8yNgFQ2E8JYynJaC4esP0ci/HO
	 xILpJdasFZOnqwoR0TufEfhwHumry6WrgnlhyyU53EDkg0cevh3WqqzAuEm5ib2vyhIrd
	 u4WDaoL/OeTnL7Qn/UfgJPHSeMAEFgUIk4kkAruinie/HDM1Pp1CYVA7zAb2H0a2CNV+/
	 owTPUNHmyVVd4SAWFnO6bNU7yAlCsHFG2QW0dKfm6oZzNVzkBupB3xkUsiGJnYMMQhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770409;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=5Op3vOLsjKgKLwppbHhkyMexS0KfO9oK7zPyIsv6o1U=;
	b=WAMKQacH3SxhgitjjPIV0Wh0lUjzmQdd/PLvqKp9jfhDNtJnq83oP97seCdniG8dp1zr
	 JC8ZNkmL/jfDYaFsppdc66MofK8YidN7zavjabYvhfQiDRZx1MkHlGIOXYBemUDEAfv+N
	 BLY7QeOuPidZb742IsK8qGELLEwji32EWnaz4MlK9ebsZY0udBK63RgV6bMfyZkXXl3HE
	 BPk1KX2mjkkPgM5Fq+blVPH/G26UIeqz+6hT8Fz1Il4n66CfiNqu7MraQOLV0IwHKN6jd
	 SVz/DjNUOGM/+X15+BN4LgPhD99+p8Y5yAm83pYbClCDRTQBRRUXxanCZTdG/EtYhnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h7ORWMSv;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="P2a/4hPA";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C561606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 09:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C561606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h7ORWMSv;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=P2a/4hPA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795770407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Op3vOLsjKgKLwppbHhkyMexS0KfO9oK7zPyIsv6o1U=;
	b=h7ORWMSvCFC6SDcKqHajOhoHRyLuGVqFBNIAn8ctPa35QRMB5Y/UnepLOSQb6kNTz2It0S
	xkD6XrvP2NOMq0n5tpb92qcR4AchMnGH1dlt6CkRoY+1+jfNq18gX8S0FoNGvDleSw2Nqx
	AnfzleTcX8Tvca0S+IwB32avnyl5J4M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-K1qnEcYePbmPDMrce7ktIw-1; Fri, 27 Nov 2026 09:06:44 +0000
X-MC-Unique: K1qnEcYePbmPDMrce7ktIw-1
X-Mimecast-MFC-AGG-ID: K1qnEcYePbmPDMrce7ktIw_1795770402
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4ab855a8c21so6153662f8f.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 01:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795770402; x=1796375202; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Op3vOLsjKgKLwppbHhkyMexS0KfO9oK7zPyIsv6o1U=;
        b=P2a/4hPArznaeL1QN2djlM8KPNYI6xK5Rlov60+LpdGbIJ4fjSxmV7wVTz+MvzyVBP
         UDOlna83PfbDVyLR+5c62mZX7ZN5U2FexCV7ZoofVAcLamiGtCiaeLlzyr7LK8v4/1Tl
         28tIt4R6z8RJzoIIfOg+kAy52oqP4GWFhiDCmLpfg0sHgSco78xczzP/USUuBDFcOYQw
         iLaj+WGdyRjkxTL3SBQAv4N36vDcIIKgEkeqCpSgcaColQBfAVYIyaQ45MdkqBppsM+o
         iDbtC6YExJoscqG+lLpMkb4mec5Gda5EtVq+B1T6q7K2BeLPSPtb4rbu8xYsRogixXO1
         kdVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770402; x=1796375202;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Op3vOLsjKgKLwppbHhkyMexS0KfO9oK7zPyIsv6o1U=;
        b=IDXDaJaBKMk16baOHQI+dXz4LvY4bKOCEJwIA5Yd4U0FFwWg6G8HS4zwbT7VrCFcN7
         3f4hJK1CyYHrrUz2P2kplPApGZ6kRmScW2R4ceNcONUYQTcFEDT3sx+NAU3v7fHg1lR7
         wIOL+9UFLEFfwplocEF9plAegAAh4zVHxWbfP8a0vJydI3nSN+q1lPCVyzyA9nlyEvQx
         PGyTsUnekYssumOdGgkVNTi/6d2v4O6oWnOfzLKB39AAmuad11bP4BWT8sebvFkPO5WK
         KfdBqX3YN2W1A8RLmghmW59t8nWtxCDIXZRd2CX9P9EycmHoTiC2sINetagLcBTI03a7
         nNWg==
X-Gm-Message-State: APuU4Z/BwfGaDwl43XVLycJRe1bJ49xu93v/PZnhnSbiY4Tkzw5rslg3
	ptysqc7whixwzs/29zRIcO1O2MfGp/5unytdVZ74SMzo4lTUjKUMRMh6Ntl6CwyAM3asg/ol+Ha
	z6MsBRHPQbtsDHmXLSs/XWXEsxPKAZaht31oo45iMOlrqon5HtVDfKg2F5g==
X-Gm-Gg: AZFdTZepF70Qxa9WMZ6ZYllsefvxHy6Q+AENn6u80CiTkTjdM9yJJKz/15d4U5rWSE6
	E/hr8+PakQ8vUfOh/cKMHcFTaEEqQP/vqaN9UFg7ZGZdJy/mkTPYx7B7h2nMXXqrat6mhCsCrv5
	fgA1Nc3jHYxZmNHAw4os15/U54tC1tsdCVyuDupFYOvPDM84TmNKM7wahxxwrSIJm1jGAFjKk23
	QFFJAqm+Eco+2ICRHspBtOUvWj3KzAeV/FLa/FjgIWD54AyC7jvuu+CqNacOVdgdhfiS9RNVGm8
	jN8OvHqSozfqBZlX+PJOOlSk2Tvvx1KXrGppnWprrqJdcEdxPK30Vr0XiSTKVQ0NkpMN/pFDFpp
	5c6qbb2q8Hu3Xudbg9EmrWte54ZCMmyhMkXWljCux+obBnWt2NUvp1mvGQ7B9poW6ncV9xOOkew
	r9sBWGfpHN/HE+cXYGwfQBPY/6eOn3BATntLT6/mU6DUky
X-Received: by 2002:a05:600c:3b84:b0:4bb:6f45:2a6d with SMTP id 5b1f17b1804b1-4bb888074bbmr575646625e9.12.1795770401959;
        Fri, 27 Nov 2026 01:06:41 -0800 (PST)
X-Received: by 2002:a05:600c:3b84:b0:4bb:6f45:2a6d with SMTP id 5b1f17b1804b1-4bb888074bbmr575645345e9.12.1795770400957;
        Fri, 27 Nov 2026 01:06:40 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399d52sm648727075e9.6.2026.11.27.01.06.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:06:40 -0800 (PST)
Message-ID: <d7c589fd-0faa-4f48-817e-66efee73185c@redhat.com>
Date: Fri, 27 Nov 2026 10:06:39 +0100
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
Subject: Re: [PATCH net] net: lan966x: return an error for XDP frames that are
 not queued
To: Daniel Machon <daniel.machon@microchip.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>, UNGLinuxDriver@microchip.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org
References: <20261123-lan966x-xdp-xmit-errors-v1-1-f25b6661167d@microchip.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261123-lan966x-xdp-xmit-errors-v1-1-f25b6661167d@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/26 15:54, Daniel Machon wrote:
> lan966x_xdp_xmit() counts a frame as transmitted when
> lan966x_fdma_xmit_xdpf() returns 0, and its caller only returns the
> frames that were not counted.
> 
> Before this patch, lan966x_fdma_xmit_xdpf() returns NETDEV_TX_OK, which
> is 0, when an xdp_frame has less headroom than the IFH or when its DMA
> mapping fails, without queueing the frame. The frame is then counted as
> transmitted and never freed. An xdp_frame can have less headroom than
> the IFH when an XDP program grows the head of a frame with
> bpf_xdp_adjust_head() before redirecting it to a lan966x port.
> 
> Return -EINVAL and -ENOMEM in these cases, so that lan966x_xdp_xmit()
> stops and the frames that were not queued are returned to the caller.
> 
> Found by an AI code review agent. Reproduced on a lan9668 board with an
> XDP program that grows the head of each frame and redirects it to
> another lan966x port. With the fix the frames are returned to the
> caller.
> 
> Fixes: a825b611c7c1 ("net: lan966x: Add support for XDP_REDIRECT")
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
It's not clear to me if the issue addressed here is stats miscount
(should target net-next) or deterministic memory leak per packet.

Could you please clarify?

Thanks!

Paolo

