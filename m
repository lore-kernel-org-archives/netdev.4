Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.61
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777627;
	b=ChRlcX4h6Xxy0tkvuqX3BXl51LdrwVm/vJST6VcW1uRpjOsmOrcfVeuEBjm1M2eaRadt
	 7YCYMNVqFDi8YnuxiG8UkmB8+tcz9xvTBah5iL5awhPzJyYkr+1cfGst8Dy4me34yAh00
	 wmJZQNafNS0RYj8Q/cb7og6pANIArjG631Kjp4c7uiCObANXtEzNEJ0CjK6T1pN+HxtZh
	 Y27y8+IwtsyyL4Seje4zeqHuMsE6fCfy4d+cKzMKP+TjUrP8KbpeWFjqxxROkn4EzulBh
	 mhRFeJtn7qEraYYcWxA1VZLlCT3v6MuuRtxo5ldXn41WxQOq3D7EdQdN6JQ0Fj27xAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777627;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=IaAGvVZSUGuwADfUv992bo35OT3PSqEu09cIol8cwOg=;
	b=2rlO7YhVKV9S9Yq1NAIWe1seTM56kHV173AFEDU2UfGsoUDmWjxscfiyr5qeZSu4fN6w
	 tVjqYyqy2PgfbY9snI6PtWloFxCmYqJ0bGCi/HKBWqP3dvvU1gclkb7l23Qi2nOUwDrYq
	 w4oAXI0vZLdt6QWiq/te/6ypGjgVgTKarw0lSNzSdgnwKjTwF+pgj8WjfCqWeyjqU7I/X
	 5D4OINnVozD09B+edWRbD0E3r5+qZsdcrwN8amCdYfJw4yaiK4HJ4Is56CYeERnSdvVcc
	 IaZoHfrQvHgqFmszMrauk3HLfnGNMfxi4KaGAwOrXYw3LHrm9ZEeDB2sGqKmcRu0pgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=Nl3ws4T8;
	arc=none smtp.remote-ip=195.10.208.61
Received: from mout-b-201.mailbox.org (mout-b-201.mailbox.org [195.10.208.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578FF606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 11:07:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 578FF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=Nl3ws4T8
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-201.mailbox.org (Postfix) with ESMTPS id 4jbVwp5G48zLlRn;
	Fri, 27 Nov 2026 12:06:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795777619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IaAGvVZSUGuwADfUv992bo35OT3PSqEu09cIol8cwOg=;
	b=Nl3ws4T8ioQLHBO6KkwOJxPSHKQumvaMzwowDk2OIhPSLALvTXOmC4GH6/k+xZC34tzoLv
	Ax00Dv2FD4jT/1niJcDa97XT58W/1jFxgmViAs8nffiwFfp1tWYQzuASbYCanSoLYg7o6V
	kSilTMTyOFeY/RU/3ml+sKpUdfYKG/sHxtgd1C+dX4EWmvJPnClQNhfGxyV5tC/KbQLP93
	8T1fV8M1TN2a7j3Og7aS9cfAu96vUsaDamoZSKLFQeBDSpjjGgivMr9zHxVplqSDvsGido
	ZXc3/PnrcZadV2qheGNDKXv8xYDbyL/bEwXhHGGidX63It26rc53aBuzJIpbUQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of ralf@mandelbit.com designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=ralf@mandelbit.com
From: Ralf Lici <ralf@mandelbit.com>
To: David Ahern <dsahern@kernel.org>
Cc: netdev@vger.kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	ja@ssi.bg,
	David Ahern <dahern@nvidia.com>
Subject: Re: [PATCH net-next v2 13/13] selftests: net: ipvs: check a PMTU learned after the DR route was cached
Date: Fri, 27 Nov 2026 12:06:35 +0100
Message-ID: <20261127110636.359609-1-ralf@mandelbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <54d8eada69c6793d4761274f9c2878c0d284fe8b.1795642478.git.dahern@nvidia.com>
References: <cover.1795642478.git.dahern@nvidia.com> <54d8eada69c6793d4761274f9c2878c0d284fe8b.1795642478.git.dahern@nvidia.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4jbVwp5G48zLlRn

FYI, this patch replies to <cover.1795642478.git.dahern@nvidia.com>
rather than to the cover of the series,
<cover.1795642432.git.dahern@nvidia.com>, so it is not threaded with
00-12.

-- 
Ralf Lici
Mandelbit Srl
