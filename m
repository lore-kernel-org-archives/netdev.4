Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621459;
	b=c+sRnEETACEsDW7aUEPTwpRVuxkVh3wbEGnn4MT6B4sQSaPUrAsep3dz7EvT5PcQUaTU
	 en2oVVcce48BN0jKNvAInKxBe7kk/m7m4kd92G5O9teV0yzCLkG29whDFIWIewyKw5jVN
	 nNQZOhku4n3gBxbeZKk9nKKVgyv2+O+dYyg6ikA1v3JcggPbvaD63irk/7C5K03FFR0Ub
	 GvHi+L03yXGsdur5QJvI4AqSROGlc6M+5LAzXeJxsRsgl2lPROEEndF5Fi1HX/33bno5u
	 gpdbO425/JelpOlZx74tWDY0YnuSbrc0qv0GZGMTeUxHXqS2vGjxyfKYbapzhEXONug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621459;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=iC7ojDwFiN7+I6mTjomu3O4mbkOEaFgiVWGSsXUSLq0=;
	b=dT8ds0emq7XT7MO0TyM1W0V9u/AumFXCweaF6kNupYr6wogfg1stpEecn/grNRy2R04Y
	 ySzR+NSckKP/53zl7A2q7SNXgdrLcqWy7LvyS809c2n81fvUME4zDdmn4w6Rq/ewrcflM
	 1oYPx4P7HcSsweug69lFPTHTODI2q2QZ7ao0o+VxKpJ7oTYgosjxlZJUWQporBH4A3/SN
	 PpiJbbYuQCv36Guty1HDpcCS/v8bi5htxrIBWf1zzQBYiKPIUUi3Tt0LXzdGzf4XAyBI0
	 qllteG/JwuTirbr3mxoCgSMCCQOtYgN3GdN9h04XAD2UL3fxEHewldA3qQptP7BcOJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G4gCVeEQ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="KX5Ys/n4";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3327C606A327
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 15:44:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3327C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G4gCVeEQ;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KX5Ys/n4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795621458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iC7ojDwFiN7+I6mTjomu3O4mbkOEaFgiVWGSsXUSLq0=;
	b=G4gCVeEQHR+yPVY9UxR8DARD71DmIcW9BJrZ06r73KQ4J3yMfAWyC8MrPYOH9ZA4TIj9O2
	jebJDC1q2sVn+MJbyVQVlk2pqhWLZwQsxU8nz9r5uoHR+4aPw90O3KnaQ/HklcOWD0PI4s
	lvz7YFic4/zxDF7fZqRWmXak5g4FWJ4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-DZiR0kz-N56SaffQ8uowvQ-1; Wed, 25 Nov 2026 15:44:15 +0000
X-MC-Unique: DZiR0kz-N56SaffQ8uowvQ-1
X-Mimecast-MFC-AGG-ID: DZiR0kz-N56SaffQ8uowvQ_1795621450
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-499ca65ae87so2698308f8f.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 07:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795621450; x=1796226250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iC7ojDwFiN7+I6mTjomu3O4mbkOEaFgiVWGSsXUSLq0=;
        b=KX5Ys/n49pTEdZfZdjbMiqQnSPDEpnUKjhFx1Aksr37iezPafiZW00icmLZtWoRIld
         RFi7eK0gP8JXkcTtfq0UmnkPRxXM+YYffLWTyLbgQscto659f/FE/ZfKaFZY0EALuzo8
         lDXXtHOClS0W1N5mUQ+eU5PL19px5ymyUzmSrDs9wsUYSMrvUnMxOQ1NJsYv2J+xie6N
         AHrT9wNGClUOl74NEpE7IMR58LkasitOdQz31oSgxhIfRbiOU5n9hKJ8zktAk5h0qiUh
         BEUL+JTRcW0xDX1kQ8ozi74HEzvBJdEBZLTLfcDo0+mqm0nCjRPQtuG9DZ5Pz5GbAoGI
         1mpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795621450; x=1796226250;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iC7ojDwFiN7+I6mTjomu3O4mbkOEaFgiVWGSsXUSLq0=;
        b=SgEy+6PznUxNHc4ysNxgeQWwZM+ShBVKUs+eGia6mHVxmOV2SHx16TxN01YKeS3uS2
         3k6GfqXcy5h3nGs4r0jmGnTlrxd84bGMJPi4q3sPnDFLk34/FvmVZATLsuLI0TfKExCz
         EhigvQJPvSNugsF3RlZ8B9X5r7DRusCKQ2bwoaisZHbsxebCUFEQ/lpghJoPSW2R3+kX
         q3GIw+8uRAdBomU4dr68+CF9nHKZWOUdtmuh4Z4OEPQvexx90mu7hu909o9UIhAkRQhc
         Wzta+g29/uGfZNQQwLgxsDu4M6QaOxZgf1yJUChv94Ot6w0Spa2PWC/8IecwwUel/ek8
         wYmQ==
X-Forwarded-Encrypted: i=1; AL+hErHG9XpEv4TOGdrd2acDZ4jAAIUMBcFRrsJLsImt50C6E8lQ6cPO6U4M8LepIu310xwVeZaVeGg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Qgshg68FCzEYttgtEr8fEUyUvKQlQjiFx7r874TOGbz7e/ZEh
	Q6pjj7YeEUqIiq6K3pnj+ZBBl0xkm8bJcArrRUDwryHRAGAvp7yFN7tiGzgb+ZqXLDVwEXAlMqe
	14WHk1ZcDgxsGCy/ELhPD/6NoUAXr5ZMni8s9KChk0ycifVS1vDC86cEsIQ==
X-Gm-Gg: AZFdTZc6YC4yHTOsg28j7Hh5SnRkMFFSpj2gCX9Y8tnWqqymEme+wYc+b0gawx5WUBA
	Hvryp38eHadF6awkKgI8KAwCM3Z3zpROk7MJgrhigFCQMcvIvwB1vcJlMKl2ot/Z7tQl9CivHE4
	OOAm7k7vvmRPEEoAnk2KKc9IX2a2zHE07EkonW5GJkbL4s9+UZow5+8S3tnO2ywBszzXxU7O1O+
	NjBLOIM71klAUrCmSs1V+C9NHJ/svIbSXENLL8YN/t+KKeSpCE9+Knofj4hspxTI1vPjOwbs5H0
	RnNJU2toqSV5maMR3gPO6nW6RJjmQcJqE9VkFzwvXFpoh/5ISoZmw9MTNvD56ci270sPKmhjsZb
	VC6ByEl2Wfyex6lP4h8eQVCkriFWqCNxdZZ6KJHMlpHCTbYjsisCdYsU5coLvtDKHF5GOTYsNip
	m+39HwxyhSDNyTSxc+SBvZGZyPzXBSDlOpuocIchhg9JGg
X-Received: by 2002:a05:6000:40ce:b0:488:8347:a110 with SMTP id ffacd0b85a97d-4abafd02fa0mr38342912f8f.7.1795621450498;
        Wed, 25 Nov 2026 07:44:10 -0800 (PST)
X-Received: by 2002:a05:6000:40ce:b0:488:8347:a110 with SMTP id ffacd0b85a97d-4abafd02fa0mr38342866f8f.7.1795621450098;
        Wed, 25 Nov 2026 07:44:10 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm35600520f8f.58.2026.11.25.07.44.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 07:44:09 -0800 (PST)
Message-ID: <711567da-17c3-4ced-b7c6-e6e6b9376155@redhat.com>
Date: Wed, 25 Nov 2026 16:44:08 +0100
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
Subject: Re: [PATCH net] tipc: validate peer address attributes in
 tipc_nl_peer_rm()
To: Ian Rogers <irogers@google.com>, Jon Maloy <jmaloy@redhat.com>,
 Tung Quang Nguyen <tung.quang.nguyen@est.tech>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>
Cc: Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>
References: <20261119170556.1518068-1-irogers@google.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261119170556.1518068-1-irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 18:05, Ian Rogers wrote:
> tipc_nl_peer_rm() documents TIPC_NLA_NET_ADDR and TIPC_NLA_NET_NODEID as
> mutually exclusive ways to identify the peer to remove, but implements
> them as two independent if-blocks with no fallback check. If a
> TIPC_NL_PEER_REMOVE netlink request provides an empty nested TIPC_NLA_NET
> attribute (or only unrelated TIPC_NLA_NET_* attributes), 'addr' remains
> uninitialized on the stack and is passed into in_own_node() and
> tipc_node_find(). Conversely, if both attributes are supplied, the second
> silently overwrites the first.
> 
> Return -EINVAL when both attributes are present or when neither is
> present.
> 
> Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
> -Wconditional-uninitialized enabled; fix and changelog drafted with an AI
> coding assistant. Build-tested under LLVM=1 W=1 and
> -Wconditional-uninitialized; not runtime-tested over TIPC netlink.

Testing your own patch is actually required. There are a few exceptions
(i.e. h/w dependency with unavailable H/W), but this is not one of them.

Please resubmit in a few days, after actually testing the patch.

Thanks,

Paolo

