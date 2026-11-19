Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795050763;
	b=VhCheoExQMltkmi6z/ba849IYX1LMBnUC9HZBwjAxsvrlbGcgCA6VPCcspZ2vjdWNhGq
	 nFnrnOaLUDkEyMp/glcrfa7D81ZW2Ud/Zzb6yqkFtbj+7qmyTjExa0mp4v38FhIr6wdcS
	 4r6V2gGiwl313DZJm9eRzauBaM0qQbRYr51Yi+RnVgQ/ArAcuy5cXEl9ZigeDroUGFjnK
	 aZ5/oC8zRZUJZKmwKZNlc3DfhffsntorAJc41lW2klBItWZUiw1iO36wI6JOJLajvd0uf
	 vR0jYKOw/KE/+tRiI+QspQenATvzkx/aaQeCBnWNadkddQB+3j9wdIczy596AkuIRYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795050763;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=pslhA7sFywAQG8AJ8str1eFXrOodMY++aOXL/6P8onI=;
	b=dtpFMbwsjIK09nTRTzLn0rB2+r3bvyRRT9CoFV1ZEkdYEy+V43RQ4Kwl/Pi/gurm5T2i
	 u10kGn5RDtMAZiF9RkbSBPRyz8VaGd2Ua5jyL7vrn+rHeEfYwWcCf7CqJ9oNFMrdpAF6l
	 Oo9b13g+Ry58wU7H4oa4NMw0uygUl6NyaTOtV746Hrjo9RbDDqGENztvJAiXvjOuX8TXf
	 iq2sKX+9RoQneg66iwUO3Y627fAiXlzStfyrUPk3KAuTuDj5dmuOju6iWatmEhfAGQT9G
	 +5ikfqjamVz/snyo7cVfU2MmP6a67ap/hk5gMVOoi7YI3lVLpfC0O9TQ5Q5kBKjrD5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="MgIa/R5j";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C075606A32F
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 01:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MgIa/R5j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 334BC1F000C8;
	Thu, 19 Nov 2026 01:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795050762;
	bh=pslhA7sFywAQG8AJ8str1eFXrOodMY++aOXL/6P8onI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=MgIa/R5jC9i8F29S8tPh5NxarsyBVzlMrCTe04KZCBcT1GI77Cq/6ki6oRqQ8CjoQ
	 p/jCjCiR3Ik9ppgW10ljXTlswrCMep6WPRaMsPSTrmTtAwQMPfEc8zall7EA9vgyG7
	 tSVA7xpYT2Rrcof7tR3z+gdmjuCY43ym4qqxXDQh+5Zl0HWeok8+6NBBnbsXcfshe+
	 WRT3HjNAiE/gqDOZIFlTy56kJkITCms2dhow0PwIV1Qcv9ObIk/2iq7uCrlbLz8/Wm
	 gSTuXzOKGLM/EWa0SXP15rv1y/kaAv7W8yq4lVxhbs8sVfplJNioj6Z13yjFkC/3Jd
	 YqSXylW2WzUVA==
Date: Wed, 18 Nov 2026 17:12:41 -0800
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
Subject: Re: [PATCH net-next v5 00/15] devlink, mlx5, iavf, ice: XLVF for
 iavf
Message-ID: <20261118171241.74a70bdd@kernel.org>
In-Reply-To: <20261110141534.95614-1-przemyslaw.kitszel@intel.com>
References: <20261110141534.95614-1-przemyslaw.kitszel@intel.com>
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

On Tue, 10 Nov 2026 15:07:09 +0100 Przemek Kitszel wrote:
> Also available here
> https://github.com/pkitszel/linux/tree/xlvf-v5
> 
> The purpose of this series is to allow iavf to use more than 16 queue
> pairs, in two modes: up to 64 and up to 256 queue pairs.

Doesn't apply, please rebase. When you do could you chunk this stuff
up? First two patches probably stand on their own? There's likely also
bunch of refactoring / prep you can pull out of the drivers?
