Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795568097;
	b=KLQOT8iW/KxzYzQta860dpw5gVNAbgFK8vX9YCIZCSfWXOOaF9ZmKi9abop4mXnc8LvU
	 oMYG7IANJc68uzPJ+i4SVPyxkgJrhhjfSsm6hlGpqZoJtkYs91XrTZoS8AnarONTHqZhi
	 CTyEFd6qJ8x+JyTY38cI7BBPnIjqeWNOgHUZz0u/ELRDNw/W+fg1WdbQVXucX3n442Tae
	 xDA0P8E67lILwZWTPO96LjRvjeEcoa2fIohtWwHHfSISlWlagaejJG7YgF6l0EgWQ7E1i
	 Us/qNJ/MHgbx3qfLmqT1tmSi4Htplr19pvclaN1SJzxjCoqhjEk/hh188KdnM0uLoxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795568097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=OqrY6P/OIPvBETWqNv5UBHtX+h2IdAEY9f4eiNCVm1Y=;
	b=Ij7uvWueiw1N0s9RSkBKf+HVbWedluhoWukHuUcSSXgI3RRphcoOSuqk4eYZkNb30hNA
	 W5iIh7UdDkqBJz0VHPTd40CzTK27XBtg14/Y8LUBxk2bdhFAQytqEsVddkhEcEsOJi0ff
	 eJHHi6dIpjrvmL8MQMpjCeZzOdnM+erxDaA3qKMKIrHTvHKuy69+XUXGTUik90gK3o7C8
	 lQvn1KA8IKNvDOfuXacAiAPl3bBk02SdH4Vyp/6sbjZDSGJvxRDddhtwnOty4hOgaXjFZ
	 0dJ0T9Y8yjtqCai2ee/C+S4ulLxtum6AMTzk4nZaGgcjZwI3Mz2oHhp4qqvYb93YV6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=efktaRzH;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F86606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1F86606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=efktaRzH
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2f0458cc9easo40502555ad.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1795568096; x=1796172896; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OqrY6P/OIPvBETWqNv5UBHtX+h2IdAEY9f4eiNCVm1Y=;
        b=efktaRzH9sgF6UPb7AxovdFZ0JlVsaR+plkccIF43pAtLntjcxhaDbv571iqoB2Opq
         UaIxBG42NijeJpqJYbGOBbJkiEUSj+flEoKtfUt/kVgBhdIYs0w8GRMfFX8LCFeL/Fxg
         br+zSXA4ToFc/40oofi4jyKhtXeEtR5QTuQXq0atzgE5h7/GKgoxalW71UzUHqpJ59KC
         T2/7iLdUFZVNR2stMbDuUB2VbZwda8TnyDwAsQZomGu3v6I5L+/NfHn7iqNLBZVrtxdp
         zs5m8UG/Tyx6DlGdupWbeODt+YrcWQHJ6Xl4fSErGOT/vMvh8rESvIju++PPXYTL8CLH
         kzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795568096; x=1796172896;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OqrY6P/OIPvBETWqNv5UBHtX+h2IdAEY9f4eiNCVm1Y=;
        b=oVhVcfHvJo1URkPKojtdBp8f5czsqD6CSHVXpUs1up0hYa4eXm05mZ0B7zPzBpSnc8
         +3ZIdFKkCDZc0+jG9qhZ1lfdaLQLSG1Pdo+/dmHcTaZGP3r1DStKkyX622mWFaRaap5H
         AuxykVhbMi8bTYNKpvHJvIInt+DwKl6npscS5OYeMKbJGBn1QRVJ8QaE2ald8Si1eT2D
         ssUHoFkrnOTcrrWLdasUMV7Dkp2ZUR6DvHuQL25eZ8WPMBZCXFwy8503SUbwD8wkCX+Y
         pgw3vGELXsjTrww0YocGeHx6aStMeqJN5I4D8fXCgYF1M66DCLaH1dTch8QhIZbUBffU
         ZTYw==
X-Gm-Message-State: APuU4Z/f7l31KtjwKb19voYbLAcWENqLpnOl9TQn/bze1zySruGloXG2
	OC2mP2kgZ+5mwPoz2sj4m3EsogYz6aqr0iQ5127K02nxiSQXBiwy/YrBCCeJa+ewXec=
X-Gm-Gg: AZFdTZeIN1eSbBdGQ65w0HJuzOVrSMP0XPDFAej/mhP1+KhG2O1ImG/E0CBNzEJ7+e/
	IBY0foqdHD8slSs6B7xP1cFFoHju9TN7ORoZ11QSMCAoRGwqerl4LDu7oSwODxT7ZMdXHJsKyPY
	ZTtnQShcuSYp0JNX1ipjatKjOdg7mHgjutLLTSNdKBAEVbv2X/bJi7naxbdrHxTsNYVhq1fUbyF
	hupbGxo7xI5bbQilhY02cadg5BHSUT6rtETwJJYGehWrsuF8wbaPMPpkO3ENhkLbaNDAscMfdQg
	NjJmJDufvQHxUukskOyWsnmFDk4zAzvITVKMKOQ/CaNygGeoQAAimTI+LMDahVBydBS5cP5ANsj
	amQ/3P8vZ3jQdZY8q31z3vl7fjflXqYwU/LYMQiVMAE9YQta4qVS3Ze/Y/4xj675aWpRv6nTfCC
	0oJV240nPBe1R9G54TSjDniJZc3T0+lVIIeHRxm1Otom6GDeJzmjlDN5ULXAZOmCqsugHHyIxSu
	g8GxVdX02vx9qSlijBAUjjLn8OCdVynK+lKrtjc893RKngDfu6SKiwsAB+ALvXaj2VTJUZK6+zv
	NgK/NoZ/f24mYZtfEBmc2Ek1NvN2Kncd9e+iTdswpc4hZKP9xfMGQpzQh4jKSVWoiG7ERcYv6Yf
	p9s0FdZXiBbU9YJ/i
X-Received: by 2002:a17:903:38c8:b0:2ed:2e3a:1fa4 with SMTP id d9443c01a7336-2f03f207ea4mr168163845ad.62.1795568096305;
        Tue, 24 Nov 2026 16:54:56 -0800 (PST)
Received: from phoenix.local (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1207f1sm75703755ad.64.2026.11.24.16.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 16:54:56 -0800 (PST)
Date: Tue, 24 Nov 2026 16:54:54 -0800
From: Stephen Hemminger <stephen@networkplumber.org>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: netdev@vger.kernel.org, dsahern@kernel.org, mptcp@lists.linux.dev
Subject: Re: [PATCH iproute2-next] ss: move to its own directory and split
 up ss.c
Message-ID: <20261124165454.36367923@phoenix.local>
In-Reply-To: <7da8ca7b-f985-402d-a314-454c9094eb44@kernel.org>
References: <20261119024049.3109143-1-stephen@networkplumber.org>
	<7da8ca7b-f985-402d-a314-454c9094eb44@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 24 Nov 2026 11:41:09 +0100
Matthieu Baerts <matttbe@kernel.org> wrote:

> I was surprised that you ended up with ~900 more lines, but I think you
> missed the removal of misc/ssfilter* files.
> 
> Cheers,
> Matt

Most of the ssfilter* files are build results from flex/bison
so not actually in the repo.
