Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794885678;
	b=aNgSlTX/JqpWpUlaLNcgmt0obctjyCeKd/SDEgZTTM+du6CNPJ9Z1VOl6X7Be5LNkGOs
	 oeOZLWUM6FA9itwCBcriVLlAMP5SxhJL6IlgVemwv71HkcLdDnOJKEpPzRgP0NhAb9i/2
	 V4EZuKNftlOwzLiKGfdwagrpNCQDsmU3mFdFjhi9zG6wuBGgYSrj0AaEEeS7UaVPqg5vK
	 VRSoerjSDOE4HcyUNzd7xeS2etWv0m28n04tVRRRw4MzOJKhyAY3L/N9oUFefWHZwUzdy
	 qJSYq4GEOetwbByN1ZPZrbY5doUzn1CCAu7ilO/FjaMQi9iIg4qmYz9LAHUISrOu3Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794885678;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=rO26LW+ufdiXNmfrDtL+Xv5fKcgTaRK83GRfrt2E/Vw=;
	b=akJmGlT0KD2bWzAnVjxvr0XDROqRGWx0LCRlwuAnko03HBWeL/S84TP0dyvqXtDdD4Jc
	 A0ohzb6lUS4Q+2A+3P1ye39eJYj3eWrfCRc+WBP010pYc6CXa3R8T4nwb2TMfQfXt8Zps
	 9IESLuqlcWGdMEmplpm7dF7RueYxlm12khNdH2H1KdiQDaCSko/tdiiElXywyUkIH9jbg
	 SiIA8I7UFBYPMcBYZlXfiIzjIBeRIEvT/Jq42k/a+RiU06pyUjwMVy6KB+By5eG/vBkgt
	 5zDGPgmyWmC/uE6sNM5+a53z2DuFZJVRuO+sOoVkPuQnC/dCFNiczx7G2mwhg/wAkZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UGwvRHmK;
	arc=none smtp.remote-ip=91.218.175.197
Received: from mta0.migadu.com (out-197.mta0.migadu.com [91.218.175.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08319606A32F
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 03:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08319606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UGwvRHmK
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3sZFLvYNczt9kFxoXbCec30m+jYY7F6kMPfr1HfDafo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794885676; v=1; x=1795490476;
 b=UGwvRHmKFgPqCIrW1+IOf7HaDew49N+BVhQHMXrArjtb7CePxOIgyfRr6iVGUeOOULHQ4piI
 ay0Igm9R9SJ/sMWj8R6rFji9eK64zxB/eI6HZ361zH2UHYSXHKlgUmpnxuMN3iAn3cYjFv6AGlA
 dDiCvcqXPqqcni1qXUUU6KWo=
X-Envelope-To: netdev@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id e1714dd81b71a4ba;
	Tue, 17 Nov 2026 03:21:15 +0000
X-Mizu-Trace-ID: e1714dd81b71a4ba
X-Migadu-Flow: FLOW_OUT
Date: Tue, 17 Nov 2026 11:20:59 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev-bot+sashiko@kernel.org, dsahern@kernel.org, idosch@nvidia.com,
	davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
	horms@kernel.org, donald.hunter@gmail.com, wessel@jacobi.pw,
	rdunlap@infradead.org, linux-doc@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	liuhangbin@kylinos.cn
Subject: Re: [PATCH net-next] netlink: specs: rt-route: move fixed-header to
 operations list
Message-ID: <avvIG9wTs3KQkL3H@fedora>
References: <20261112-ynl_fixed_header-v1-1-8475ea19e409@kylinos.cn>
 <179460807877.2199510.9635428422960175112@kernel.org>
 <20261116183921.50286c0f@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261116183921.50286c0f@kernel.org>

Hi Jakub,
On Mon, Nov 16, 2026 at 06:39:21PM -0800, Jakub Kicinski wrote:
> On Fri, 13 Nov 2026 22:14:38 +0000 netdev-bot+sashiko@kernel.org wrote:
> > [Severity: High]
> > Should this be fixed in the doc generator rather than in the spec?
> 
> 👏️ good AI. I was about to ask this...

Thanks for the reply, I just posted the new update.

Hangbin
