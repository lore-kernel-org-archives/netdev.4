Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794775572;
	b=Hx+bI4AnNSYa3hvEmJuNazEZjMuZmDVP+7RebDtk84rhK6pLWVFiNvQ8OIKPhuNUJKqJ
	 2yefHzeFJ+EPeRFWVRTOMxTin+XOPkl4PN3KnJyRo+ZdwLfqXDhtwFYJ1V2gZpPCBigM1
	 NXAPhs3ECV+WZxe0mqhcxDllWdoVh9CHSwMQ3FVTN9YhymKCeVYO+MwKv8yhmZrkRedAG
	 cTNwcQZsHqgsF8CsS0bpmzamu1ldQiZj9A5MIUGvtVNkzrtCyFydC06uMQOphTuONFrGE
	 kwDI6qchc5Q8hRYlAuO78LhQpn3AQGkz9vjoNcWiK0Q3sSmclzMIg82kZed0lN+9I6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794775572;
	h=Received:DKIM-Signature:Date:From:To:Subject:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=o4nMW0CRDeo9cjD7p4HO1GqI2OU2Hfaq3546th1/gis=;
	b=ON0sOG8aJh8Tt1C3HzDHgQcG9eRtf+47oSg0c9yoet9+WfS7pg/9/PpmxRD8VjLgC3Ip
	 eGA3jr0Y3pQYZu4I9B929uEftAYGuXl/zEg5x4HAW4ZnlzoBnj4kfy0dwMGATLP4E2CAp
	 yfGLcvqgT2h4v8T4qefMH32ZpN/YKCvwH+iSwby+kt1S+4LJX+tWhia+5/JBVtKLiO5sl
	 RFoSxkliynSxbVLoxvHJeZHN7s1mXV7ETbF9+soO0mHQMJQzwa7W0Zun9n4T0BsUbSMk3
	 o442ycZloIUadMhEj1O2KSTRThG9FC/wVyI42jhgO/us5Y4ZKalGCuUSwz1eZMvGe/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H3rWkh13;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C566C606A329
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 20:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H3rWkh13
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53E031F000C4
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 20:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794775572;
	bh=o4nMW0CRDeo9cjD7p4HO1GqI2OU2Hfaq3546th1/gis=;
	h=Date:From:To:Subject:In-Reply-To:References;
	b=H3rWkh13Wr9B2PcEn3v2kQRwvDBkyJknhLgy6/r/99ldaxrvP6zcfEvUrjMgOYaQt
	 1fABobw+OmqaCOTjT5luNoYpNMm8jq2MzzDysWCrWCZRdFe84CfM9e+3T3mWxtidBV
	 xV+WjauDxHgnuPrheIr2JibZnO5GTe5GWEcMoQs6F9qLA1mOVlThUCGmvmloiUtrOi
	 kJPIyuPcdRCM8LLXSR9+7zTUMqNcqkJh6ty0M2fspqgfW9UFWsOnOFN3mhkJDJ0d1g
	 zKyz/YvmOpwYDx/rVb/PJxjSnwKT9WjvtMeVbR5vIx8oZYls59QVgeCOJWAZUVn1LN
	 WL8BJq745SlNg==
Date: Sun, 15 Nov 2026 12:46:11 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: netdev@vger.kernel.org
Subject: Re: [ANN] patchwork is not ingesting patches
Message-ID: <20261115124611.5c09d596@kernel.org>
In-Reply-To: <20261115111604.5933171b@kernel.org>
References: <20261115110210.4a3f0177@kernel.org>
	<20261115111604.5933171b@kernel.org>
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

On Sun, 15 Nov 2026 11:16:04 -0800 Jakub Kicinski wrote:
> On Sun, 15 Nov 2026 11:02:10 -0800 Jakub Kicinski wrote:
> > FWIW looks like patchwork (and therefore all our CIs) stopped ingesting
> > patches on Friday night. The k.org admins have not responded to the
> > report, yet. Not much we can do, but do expect delays and (even more)
> > pain. After an outage like this it usually takes our CI systems until
> > next weekend to fully catch up.  
> 
> On a closer look - the lore git archive for netdev has stopped.
> So if you read this and want to make sure your patches get into
> patchwork - CCing bpf@ should do the trick.

The problem has been fixed, patchwork is populating. 
Expect the delays mentioned in the first email..
