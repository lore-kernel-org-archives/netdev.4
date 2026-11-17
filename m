Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794909645;
	b=cIdswVWAdoQ6wPq3Asv1DP8qnSUzMDOZydcvBPLk0Fr3e24cMpB+RVvwzzn91lXTGpOk
	 O1lJOSU6l9A3Auwd7rfZcze6m3ZVhmCzVQlLHig2R1m57cjfXH9gN33kNR07KtAUiu9zG
	 nKcRHbxYTY6HuWh4tuH4is5YPSSvmKiz/Y6qvz2l5A5kV23sRUMwRp1nc0nQcWRs6yOv7
	 1Fpca1jVl90mCybQI0MScjyj4i1KA2zgnsLhIHnl0CsBYEayu01sqIk3CF924nbGAgWeH
	 GMEc6eOul0iLmf18SmDtCO0hbB9cJIi3QRituaJ5KHCTWIJO4mJMIeeapDepwaGnHaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794909645;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Y9UjBOHnP3jYIfHPwpekDZ4sBjaCiEDL56fvq3n2mz4=;
	b=ZN+1hS0i8YyeyqSAX5y3jRUVxUnQ4vLHQBQAGYDGpNCBsJmyGDudv4pPhdwSz/3KM2Yv
	 uaql2beOdvNgAL6xTLnVqQzJOiQAWncvFtE+U/EHRC0tpHHpyx104ZytD6p1hLlNG3DUG
	 58A3+kJEaJocrCjphTmyeTadb7woE5ROVTX3WOGAMvGsqy59O5uHotZGz3tOSZxIoHsNW
	 5UHBmQQWUKzs5FFELWoqy3Cquul4DMjqrJP79T2rUzB3esfGkZqZQdrEHggcr5Anscbdi
	 QDh8MYsWRuD8TiDjx7bA3Dr2XKElkxwYW8WDeomInvBZy8Eq3MDFA/cjbzBw4SM/4+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=er0NO7JN;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=mVsXSHDB;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664DE606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 10:00:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 664DE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=er0NO7JN;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=mVsXSHDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794909644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y9UjBOHnP3jYIfHPwpekDZ4sBjaCiEDL56fvq3n2mz4=;
	b=er0NO7JNJnlaoA99NcIBeQ8/e1k+vC/zWoFbykJfj/vjL/UpWZP02GRdVxF8kcDRWCOLFH
	D+49VzF/dVlDL1vAiH+ojuKmPWwjPxT61qkA0JVd66edZ9dmqqQ6f7bhQvanUYJqni7Nyd
	dpY1/31RX7Ozlif2lHzWR6wh36rYJkI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-5BHixt4aOleujtGmCr6nJQ-1; Tue, 17 Nov 2026 05:00:25 -0500
X-MC-Unique: 5BHixt4aOleujtGmCr6nJQ-1
X-Mimecast-MFC-AGG-ID: 5BHixt4aOleujtGmCr6nJQ_1794909624
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e0af48c18so2964239f8f.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 02:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794909624; x=1795514424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y9UjBOHnP3jYIfHPwpekDZ4sBjaCiEDL56fvq3n2mz4=;
        b=mVsXSHDBHijstb3PtRqKjzq1ie/aovDX4QPhq5JoU0j70f16Avkmp6ibFy+qsN9rmZ
         sR/kQ5F5QxUu9l6roqarMEDsyg4QGPUVxUvPTEcPvsyiPDpO29D+imimrlUJmp7EyIfJ
         D3+LZB+oRlUq8mo37+mlsWBSYw6YnrojJpML2EeqeHzi6FJ/ghnmDul0sBmc0wg6gNFo
         lOSiwMSTnuO4adFlKOR6XJhcsxttMODYgMChDEf1S9nnpvEAbMBNQ2JNKgEcT05xDjib
         y18rpONwK8s26btzknqlSw8LobtcM4N6OI/I980YOMvLQaSHwQuFOrTVP04V+F/Wnn0A
         k7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794909624; x=1795514424;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y9UjBOHnP3jYIfHPwpekDZ4sBjaCiEDL56fvq3n2mz4=;
        b=zhtwQn1ANywlW8fFfDpIMbEjSvje8E3Zq69G3uFsMFhNEw3cOSp3j8fmVhcGZXV0tp
         oCN81RhSvV552pMUlSTFsVp55ejd8WyEYCrqkc8NZHMrSRogCkMyNQMMorL0eR69ZDIO
         DJHCwH7yCXPtvgS0q/bl6OibFxmifRXRg0G3LxuMHzX1LwIvu6Nqj2wOrOfqNKPR0jKZ
         6JGGEbBaak6qjJ5nr0O9TNggDfA6WEh71VHRb+W+1uqRoCAU4pTTKFnoHLxyQOT2RPdU
         87LqBmsDnckB7R1yunr/4B/ezVMH+S3JxFPU9G/VeUWKizUrtSXT2Xb3/pgn9Dp+NDPa
         Sv6Q==
X-Forwarded-Encrypted: i=1; AL+hErH8nSWINfUkDZo80Vwk1BZM6Pi92p69efrlAr+WMCEafPkrtbdT7qbHkYNE4TEZyCnU9dNa7+o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/CLjt5Y8sDGhNmhns/ePwoEgkNF0+EeNhWSIoNWhcQLYW7D3g
	PElLJdcAzp+h1PpqivblET53GdrvCUKl/IYLU+EgVIJUd9Kb/sIk2haM168rYGRGtSUN0Fn51nd
	G5GVB2NRgmACPlHQdchyyqtjDTTBLhbCeqsAqCBxn81w2hKWKgIMZhlRDJA==
X-Gm-Gg: AZFdTZegOq/YjTLEMntdsBAbwwa9ezcsT6ZNSRE+zrSX0Zyg3zZTFQX6TqPQCYmyxAF
	B5OYRaXOGnJYrZgQ2bgeG9FnJdiy7NEoV4YPC2n60WXRXn/PoWg51TRnqwzc2V3LVgcGCB4Xp7P
	xcqiEXaS4tKo9I2RWsj+UMzBiAE5SjH9IDexn+UfZMgW8MyUYyZ6ZCYg/N4U9FNnyhMZQ3rho13
	sayREKpUp6TylCvKDDHWpwnVb4B7l3oLYypqjNzESXEjWrXQqTcuCFq7yanraH8Rq2tVAsR8tii
	taB4huKH2CULTZN7H3MjssmshvBOYSTRImikd4riBzna9PW5xDOnqP4hcZ0iaXsTQoL8Rd49HuD
	gZR4wmKDGcgPJZG8jQ4rdFban8x1KvJRlhIwMg0HSPl45htTc5GcbW1FdS+oUQpyCntxCl2bziu
	zo8wRwSaAKxNlzf4QaDJ3iI5Zz2rRedzq8UjBNp8Jk0uEO
X-Received: by 2002:a5d:5f47:0:b0:48e:4115:f3e8 with SMTP id ffacd0b85a97d-49c712ac6c0mr28211630f8f.27.1794909623176;
        Tue, 17 Nov 2026 02:00:23 -0800 (PST)
X-Received: by 2002:a5d:5f47:0:b0:48e:4115:f3e8 with SMTP id ffacd0b85a97d-49c712ac6c0mr28211557f8f.27.1794909622639;
        Tue, 17 Nov 2026 02:00:22 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a4de4cb1b6sm1436394f8f.3.2026.11.17.02.00.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 02:00:19 -0800 (PST)
Message-ID: <39940277-ffc1-4ede-a9d0-605ba0f8ad3c@redhat.com>
Date: Tue, 17 Nov 2026 11:00:18 +0100
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
Subject: Re: [PATCH net 10/11] ipvs: do not create conns from packets with
 port 0
To: pablo@netfilter.org, Julian Anastasov <ja@ssi.bg>
Cc: netfilter-devel@vger.kernel.org, davem@davemloft.net,
 netdev@vger.kernel.org, kuba@kernel.org, edumazet@kernel.org,
 horms@kernel.org, fw@strlen.de, ja@ssi.bg, netdev-bot+sashiko@kernel.org
References: <20261116004404.2821183-11-pablo@netfilter.org>
 <179487963329.3136.11227226787276094605@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179487963329.3136.11227226787276094605@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/17/26 02:40, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] udp_conn_schedule() (net/netfilter/ipvs/ip_vs_proto_udp.c) now
>    drops every UDP packet with source or destination port 0 that matches…
AFAICS this is the only new/unaddressed comment in this revision.

@Julian: could you please have a look?

Likely no additional revision needed, a confirmation this under control
would suffice.

Thanks,

Paolo

