Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557456;
	b=GXMtQcG2pjVxMOzVlR4r/zAUXmvl44JI5xA0p7r/Iktm7cJSSaUYxxuNdWfOPSzyOxbr
	 pyTjum7gDhx4k4h8le+N93FIpjRoaQGzYBURa/V86vpjEGxGgkGDZbbdJzuEroVVo4e12
	 BJ6RtUq9ur4Hs2FL/0nAqkeouwgkITiOTMhzO+Tr8UVMp9Sq3thBODIxn4ffdL9pDWQ48
	 BOKAL0VpqmFHodtjefG4mZvXwA0G5vUyr2VtmxjSfBgFbkAKGZYrenz0/QZ+/GbNccnrw
	 pcRnfYczk6boAY4QBCGbGbtfKf5LggsgdhxtuKOocHkkgHByVlwG0MjqPT/AxrEd7PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557456;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=CXMWcmmWbsNSwx3Yot88Y0ytFCtq8HiJYQGhUD8ZmRQ=;
	b=QCRt2+h1W82q/K2T0HZXSwmPheEpSc/BJNRnQkHa4tkQmDflsBHUE5ckSMLGvQLyDLn9
	 UgjMxzNd9+rPOy2T/Jmgp3rcA7WGQIRT5fw+urSdo7PTv2NC8yVdrhHjRFbGiLe+4P7iS
	 fduwh28eft1gQAv2hrXhmUD91kZdxMMkF5V5+mpjmVT3vWyA03nIoRiqSXbdZoMMEPqa8
	 1KDQabElcsmIHkvWE7+2SMc7F3/3M2jNuODRrqvikP/qJVcELAjWrPWOU+U7wRPbvDRCR
	 7fkCkWfJk8Tmwt02MSvyxpfUOsfqQ8fYsNWRbE+zaCw3MN2dxH+1dALycrDbtVK1o/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fsa0eLKw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA35606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fsa0eLKw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6E411F000C4;
	Tue, 24 Nov 2026 21:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795557456;
	bh=CXMWcmmWbsNSwx3Yot88Y0ytFCtq8HiJYQGhUD8ZmRQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Fsa0eLKwZRWjdSJmvZn0jESzlEUgETFXFFlN6NnbbKQjyydkNs3tgI7nbSqyWp6t9
	 x/1BC+s/KTQkHOY+ouQuhYL5kHWJgVM7YmX1uuxc08zuHJEuY/PqxFHSR37eqdbNOp
	 meEhm4HGKpBcyK15/5FQWSJloh5IAxLBlYmoe3pw2hwser0MUkZ82+7HHnCfeOWAdt
	 1HkGFqeJw09hmu8lTpOxtoybWbZ1nkGFWxisCt5cuiZ8mA0MW4ce0bfWzm0ik+VBjO
	 O4yFgDAjnv1Pm2C7zotfZuSQCKSuvQfnlA4OBKymoCi0MhEw4BPrAFhpGnq6pbU0o+
	 XWN7/fVWa55LQ==
Subject:
 Re: [PATCH net-next v7 09/15] iavf: increase max number of queues to 256
From: netdev-bot+sashiko@kernel.org
To: przemyslaw.kitszel@intel.com
Cc: netdev@vger.kernel.org, kuba@kernel.org, jiri@resnulli.us,
 anthony.l.nguyen@intel.com, aleksandr.loktionov@intel.com,
 mschmidt@redhat.com, edumazet@kernel.org, horms@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, andrew+netdev@lunn.ch, saeedm@nvidia.com,
 tariqt@nvidia.com, leon@kernel.org, mbloch@nvidia.com,
 jacob.e.keller@intel.com, jedrzej.jagielski@intel.com, anzaki@gmail.com,
 brett.creeley@amd.com, ohartoov@nvidia.com, poros@redhat.com,
 donald.hunter@gmail.com
Date: Tue, 24 Nov 2026 21:57:34 +0000
Message-ID: <179555745441.3135.7053270050091454026@kernel.org>
In-Reply-To: <20261121230123.316391-10-przemyslaw.kitszel@intel.com>
References: <20261121230123.316391-10-przemyslaw.kitszel@intel.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message understates where the patch applies the legacy
  16-queue limit.

--

iavf: increase max number of queues to 256

This raises the maximum number of queues the iavf driver handles from 16
to 256. The netdev is now always allocated with 256 Tx/Rx queues, and the
queue vector count is capped at 64. The legacy virtchnl paths stay limited
to 16 queues.

> Increase the max number of queues that driver will handle to 256.
> Use old legacy limit in the virtchnl handling of iavf_map_queues().

[Severity: Low]

This isn't a bug, but is this description complete?

The patch also caps the legacy VIRTCHNL_OP_ENABLE_QUEUES and
VIRTCHNL_OP_DISABLE_QUEUES bitmaps in iavf_enable_queues() and
iavf_disable_queues():

drivers/net/ethernet/intel/iavf/iavf_virtchnl.c:iavf_enable_queues() {
    ...
	vqs.tx_queues = BIT(min(adapter->num_active_queues,
				IAVF_MAX_REQ_QUEUES_VCV1)) - 1;
    ...
}

The only explanation for this is the v5 changelog entry ("cap the legacy
VIRTCHNL_OP_{EN,DIS}ABLE_QUEUES bitmaps at 16 queues ... BIT() above 63
queues is undefined"). That entry is below the --- line, so it is dropped
when the patch is applied.

In this commit the min() has no effect, because at most 16 queue pairs are
still accepted from the PF. These lines are still the same at the end of
the series, though, so the legacy enable/disable opcodes leave out queues
16 and above without any warning.

Could the commit message also mention the 16-queue limit on the
enable/disable bitmaps? Readers of the applied commit and backporters
would then see it.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261121230123.316391-1-przemyslaw.kitszel%40intel.com
