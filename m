Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529483;
	b=p/aZUwh7kzvJNJMkwSFgAdOhK5RuQvPcXCn2H3tLrquBG5ftl3UJ5OKEMU/oUXm/o0C1
	 Jw5tm+TLULQRpQ+IFSpBiJIPOah2lWv/MgRPDOP7KllQ5WpdUPaFmhSVE/TnjirCwHn62
	 CMdf8UrPONXWYMWNQMRCU6iqYrEQ0DLOCyWL32sJWwKGnmcd1Zz8Qt0nGCOqKTGBvEc3j
	 s/RS9RW/7CzFRNLfLfkOG2VJ0g97mKbX8iZ5CuKCfEq3OGuZKiXEESlRK39m2yd+H9GLm
	 LU9hmIIwtNKB5a0t6kov/VQ9SKpeaEpkhb8N/vAVREVZbLezWTMjStWV1pJuE+29nOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Reply-To:Subject:To:Cc:References:From:
	 Content-Language:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=mGhkRCw615KqlCBkyhl7izYjlZJ6697FMj2w/c0mOoU=;
	b=TKKrSfXMK1BWSQDBkEeLUVQAvB3SriK7eCl30BRRJ1mwfOMYaxPtTE5hXw+8x+yE1mSd
	 iNDHKW1b9rLlpZfqCUe3pz/OPSxl0UOuOV73OKXZAW9d+DqXh0gW2HiVndSEPBG4rGwYl
	 T20GMKGBUahQGzKh2XP6Y32eiQvBw8yeSrIZAoQMco1UyjQkB8XDKUTbhcg0uBAe7EzEk
	 rZiekTkzuek/CR6RzsOEgdWVTAGDZy3D5Plg7E2VMWrSp0zxhELKhJIXM6tbmnlHVTVCT
	 xnO1sixuBUiM267dN9+dluYM0rEmBPkllpbic4JsDgyhBcfRRs88ML/50AIn+u1APcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=6wind.com;
	spf=pass smtp.mailfrom=6wind.com;
	dkim=pass header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=UqGS2jrm;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54BF606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 14:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A54BF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=UqGS2jrm
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a35df85cc8so333798f8f.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1795529481; x=1796134281; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mGhkRCw615KqlCBkyhl7izYjlZJ6697FMj2w/c0mOoU=;
        b=UqGS2jrmomUXTfSDQ6lU8rH1S4h5PwOcG+jyYnSApYEu8Vqs1dR3qJasCCgI88ZKxP
         LACCySEQCDFbJ41eaG9DzZh/tZinbuHkXgs71GpgL69xwyxYpWgCeXtkYPfloFcOhk3p
         +rtJUhyRhAXY3tvDU23/ZAEJEFwhtl7Iv+Fud9pwqyksdP22YBjS0MPpxRKY8vGD5JIX
         AaSsrU6qFOiAs85CwG8ORJzaKfcKNG/apu0sVLbwWutWrMQrbwDEvSjHKR8qplD67i10
         SJdHEfpBixq6/mvg1bA53jZ0iWUHPu3X3Lqgx+fbv0DpRwmTUtPlQEQ1mTYn2h/I0iIZ
         +9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795529481; x=1796134281;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mGhkRCw615KqlCBkyhl7izYjlZJ6697FMj2w/c0mOoU=;
        b=QstxICryctE5ZWmh0mHkLqq1zz8UVkFeCAEglNwWat87OAhz7KXFy3VtMtfmLn0R8J
         8OLug8WrklfhSG/DB+Y1LBz6sfgIg5VR0YtR+K/X0PwxL6yW8AVe6TOl1iFAyryfZ1KJ
         o6VB1ugSnjPAVqNQCzvRg8aqVc5GpZjzqVX8VYI7jnX8sF4W9+1yFz0kMoPA1K5FtRFD
         hLRbh8/JG8Je3Md2/Fou5kfCW5yDVJPvoQnEn0Rl2NjJ9gA6jUF3gAjZQpesEsTNIl+W
         G1+D8RHwEW98+O2uA9WKuNozHYsnJqvbx2/4mlPM4KOmTNYcWFWQo6cMrFV0ffxGdlx5
         PnOg==
X-Gm-Message-State: APuU4Z9UQ720ARqRGd/gMIqM7T6U+7OeX0XRqVNBtPQF9B3fjJG9j/IN
	ITCmUo9K2nC9p29dMI8lruWcJGcibjpEE8kXQERTd8IsD7tExPfUYxsnzxFMzFQXtMU=
X-Gm-Gg: AZFdTZfXGdIJlLvthhjXPdKprs2hy7RVHNnXCUxytnYBbYiJqoTCKkB2wh9T04KHJld
	7m7zJDTF9YJqvdOfvYjAZH3cnm/iSw5ETeKUEKiUYOBus2zR6kJnDKqFu+C7Bnjn5Jqq2cndJ5Z
	Bhq0ZkReZP6dT4VAYYBhKT0lpgqGLn0KuqJddUIzuE9DswDOy2ynWnsaFfJXtF3JASWkUqaKkI+
	3zLohQ+0ajrToyWpKFFZrj7AqzTm2pSJN4VmHsgqrLay9lyksGGOvIXlRQcyLOXPw1l+OFnrzXV
	P5WcVRRITjgKNtxrDjqJV+7m/wUJdwEVIHbNNXIpQLYeTfEIlpjnu5iJFEBU1psWYNMB1oGed7J
	Ko6vAyBrvXblx/Tydgh4vcRSrBFKXz+lQqakKOR3aqBEJ6txJbNEJ8VzDxV/SVuToRnsll73vbb
	0hgO9EsQeCoUS/0L1X1uaIDrDjhFi21kGNotuEeAFPx8cJxSVYpJu2xYyG1C5rLOM0MO8xJlMrl
	nZlt8zKwfBY7aTwhbqoCIcHCAhQWTPmmt3FLoI3Jz5BoI+6Jru6YKN7O85+vgZcFXAC8mXK9kcb
	IjfAxpAq0JeIbAxDZeS0gsDvhUvASM8ir7AuH0mfLONm/UWytrj34UCOLa28oz8menw8s/CONwA
	dlfq3AJ3DsEzSOvjBmC94Y0bXI1Y=
X-Received: by 2002:a5d:5d0a:0:b0:4a5:d259:4c57 with SMTP id ffacd0b85a97d-4abab7df50dmr33724301f8f.2.1795529480872;
        Tue, 24 Nov 2026 06:11:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm29001139f8f.48.2026.11.24.06.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 06:11:20 -0800 (PST)
Message-ID: <51cf7a82-6680-4ac9-b714-8bb28afb65fc@6wind.com>
Date: Tue, 24 Nov 2026 15:11:19 +0100
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
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net 2/2] selftests: fib_tests: test IPv6 source address of
 a VRF
To: vjardin@free.fr, David Ahern <dsahern@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20261123-for-upstream-ipv6-vrf-saddr-scope-v1-v1-0-f667ab150ade@free.fr>
 <20261123-for-upstream-ipv6-vrf-saddr-scope-v1-v1-2-f667ab150ade@free.fr>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20261123-for-upstream-ipv6-vrf-saddr-scope-v1-v1-2-f667ab150ade@free.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 23/11/2026 à 15:30, Vincent Jardin via B4 Relay a écrit :
> From: Vincent Jardin <vjardin@free.fr>
> 
> Check the IPv6 source address of a route of a VRF through a device
> that only has an IPv6 link-local address:
>   - the address of another device of the VRF
>   - then the one of the VRF device once it has one
>   - then the one of the output device
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
