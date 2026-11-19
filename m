Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795050006;
	b=bOf6U1619xLQM5eIoYr/b1nOypfy9v1oigflLw1uMiB7e8wFWcy20BUyhHcYXzcaPV+W
	 28s0VZbZdRtXp73ZI1jw50ZQ1bqfZ45hwrcaq6/Z3HYlr31YjL0wCA32tcjnGG6NC12ae
	 vc4UQGW13HF1h5ePDwtZ/YBnh+8Gts/SX7JT1P804QQ5acd54zo03RriK2KijatHmRyTj
	 E8ksH13qZ+ABJn49G9wV+IcGJ4JkmO7GJNBWSCjOfrlDP2xHwAnP596nDlkENAhfFlWBj
	 EbU53hje8undQGB7Uln2p4+Kdgaq3o966/Ydn1N0RPVytC0EeBK9+8bhS10vX88lHlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795050006;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=7AhLGHb9m8zSBl48X5m/ooMb9JFfV0IPSDtXv2YHFOQ=;
	b=Azt5Gki2fNMLpFU1gOD9Sd307Plwk02AYmLl/bHLRbh+xP7DUD9la5d5ANbv8oArONFN
	 uyep5vzhB6cSnp5lVNrssabs3ayOCGuvS6CDeqTtTx5NeoMgl0DvFml/PZXlygQ8rqojh
	 J5l1egcFcToxmi2pcB8ugA4KBAIVUJEf/+LhNt28szP4GaS6ZQ6AB5Qp+zqqWvfoDw1WC
	 JrNnMfBC/6kFPYZYTUwZ2h/BI95l1HSsxp+WY+zm2/qeL5e43uWpCZHHOfBgWP9xxvEX3
	 RdwUsj/PRTkULO4xsIlQu0fOcvVF4d12Ng55du59A/HHeALJi1uuAcx50zrCWKwYSHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VOIbRFGr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148CE60A3837
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 01:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VOIbRFGr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B879D1F00927;
	Thu, 19 Nov 2026 01:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795050005;
	bh=7AhLGHb9m8zSBl48X5m/ooMb9JFfV0IPSDtXv2YHFOQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=VOIbRFGrRvLKkj94nsFGMJ3++FYW9QUNn+RolYFEsVf+qHfu5nwc2PQejTvh8GBKv
	 f2QpP4Ow5s2Pd9fL3wJKfLUo79wNUGODkOPBCr4s5e37jxtwLCKN8fhizxv943GS/R
	 5xwFmj5BuLi46QF2akwZBqHh6X0GKVqefsh52T5VpCCqenfBHzbs1g6lHQ7Syl/CLQ
	 nuGZuRhs22RiyJGpVuBknaAbzY7faDfwCV4vAJPGR/ihxHBXG4ZP9fA1AroX2Z32Vc
	 p1B4OAuCYBQ+BXa/c27GuRhcpQiEIueO/c81/5X8bCit6gzOLcyR7222mPq3+ICqIb
	 0bV8e+4tLQyZA==
Date: Wed, 18 Nov 2026 17:00:03 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: netdev@vger.kernel.org, Tony Nguyen <anthony.l.nguyen@intel.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>, Michal Schmidt
 <mschmidt@redhat.com>, edumazet@kernel.org, horms@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, Jiri Pirko <jiri@resnulli.us>,
 Jonathan Corbet <corbet@lwn.net>, skhan@linuxfoundation.org,
 rdunlap@infradead.org, andrew+netdev@lunn.ch, saeedm@nvidia.com,
 tariqt@nvidia.com, leon@kernel.org, mbloch@nvidia.com,
 jacob.e.keller@intel.com, jedrzej.jagielski@intel.com, anzaki@gmail.com,
 brett.creeley@amd.com, ohartoov@nvidia.com, Petr Oros <poros@redhat.com>
Subject: Re: [PATCH net-next v5 12/15] devlink: give user option to allocate
 resources
Message-ID: <20261118170003.2f6501e3@kernel.org>
In-Reply-To: <20261110141534.95614-13-przemyslaw.kitszel@intel.com>
References: <20261110141534.95614-1-przemyslaw.kitszel@intel.com>
	<20261110141534.95614-13-przemyslaw.kitszel@intel.com>
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

On Tue, 10 Nov 2026 15:07:21 +0100 Przemek Kitszel wrote:
> Current devlink resources are designed as a thing that user could limit,
> but there is not much otherwise that could be done with them.
> Perhaps that's the reason there is not much adoption despite API being
> there for multiple years.
> 
> Add new mode of operation, where user could allocate/assign resources
> (from a common pool) to specific devices.
> 
> That requires a new .occ_set() driver callback, called on
> DEVLINK_CMD_RESOURCE_SET with the requested DEVLINK_ATTR_RESOURCE_SIZE,
> instead of staging the size until the next reload. Driver registers it
> together with .occ_get() by devl_resource_occ_set_get_register(). For
> such resources the getter value is reported as DEVLINK_ATTR_RESOURCE_SIZE,
> as opposed to DEVLINK_ATTR_RESOURCE_OCC (current occupation) in the
> "legacy" mode, and there is no DEVLINK_ATTR_RESOURCE_SIZE_NEW.

I haven't read the driver code but I wonder why you're making such
changes. It seems like you want something like param cmode - your
size change is applied at runtime which existing size_new stuff
is built to require driver_init. Why not add cmode to the resource
to express when change will be applied?

Why you're messing with "occ" I don't get at all. occ(upancy) is
current use. See comments on the driver patch as well..
